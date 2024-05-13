/// Every response from the functions in this package has the status code of the
/// API response, as well as some response content, which could be a Boolean
/// value, a TabNews data model, etc.
typedef Response<T> = (int statusCode, T content);
