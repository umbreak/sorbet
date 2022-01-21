#include <string>
#include <string_view>

#include "common/Exception.h"
#include "core/StrictLevel.h"

namespace sorbet::core {

using namespace std;

string_view strictLevelToSigil(StrictLevel level) {
    switch (level) {
        case StrictLevel::None:
            Exception::raise("Should never happen");
        case StrictLevel::Internal:
            Exception::raise("Should never happen");
        case StrictLevel::Ignore:
            return "ignore"sv;
        case StrictLevel::False:
            return "false"sv;
        case StrictLevel::True:
            return "true"sv;
        case StrictLevel::Strict:
            return "strict"sv;
        case StrictLevel::Strong:
            return "strong"sv;
        case StrictLevel::Max:
            Exception::raise("Should never happen");
        case StrictLevel::Autogenerated:
            Exception::raise("Should never happen");
        case StrictLevel::Stdlib:
            return "__STDLIB_INTERNAL"sv;
    }
}

// this should be used for error messages, since many of the levels
// here are internal-only and should not be used in user-facing things.
string_view strictLevelToString(StrictLevel level) {
    switch (level) {
        case StrictLevel::None:
            return "<none>"sv;
        case StrictLevel::Internal:
            return "<internal>"sv;
        case StrictLevel::Ignore:
            return "ignore"sv;
        case StrictLevel::False:
            return "false"sv;
        case StrictLevel::True:
            return "true"sv;
        case StrictLevel::Strict:
            return "strict"sv;
        case StrictLevel::Strong:
            return "strong"sv;
        case StrictLevel::Max:
            return "<max>"sv;
        case StrictLevel::Autogenerated:
            return "<autogenerated>"sv;
        case StrictLevel::Stdlib:
            return "__STDLIB_INTERNAL"sv;
    }
}

} // namespace sorbet::core
