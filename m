From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v5 2/5] Add support to dump rsa related fields
 for t210
Date: Tue, 13 Oct 2015 10:22:34 -0600
Message-ID: <561D2FCA.9030607@wwwdotorg.org>
References: <1444441574-17205-1-git-send-email-jimmzhang@nvidia.com>
 <1444441574-17205-3-git-send-email-jimmzhang@nvidia.com>
 <561C393E.2050707@wwwdotorg.org>
 <ab16c6505a7e4e62b726e6433dc585b8@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ab16c6505a7e4e62b726e6433dc585b8-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/12/2015 06:56 PM, Jimmy Zhang wrote:
>
>
>> -----Original Message-----
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Monday, October 12, 2015 3:51 PM
>> To: Jimmy Zhang
>> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [cbootimage PATCH v5 2/5] Add support to dump rsa related
>> fields for t210
>>
>> On 10/09/2015 07:46 PM, Jimmy Zhang wrote:
>>> Add support to dump rsa pubkey, bct's rsa-pss signature and
>>> bootloader's rsa-pss signature.
>>
>>> diff --git a/src/bct_dump.c b/src/bct_dump.c
>>
>>> +#define ARSE_RSA_PARAM_MAX_BYTES	256
>>>    typedef union {
>>>    	u_int32_t val;
>>>    	u_int8_t uid[16];
>>> +	u_int8_t rsa_param[ARSE_RSA_PARAM_MAX_BYTES];
>>>    } param_types;
>>
>> Shouldn't that be replaced by something that uses the new get_size()
>> functionality now implemented in patch 1?
>
> For this data structure, I guess we better stay with a MAX constant.
>
> For display functions, ie
>
> values[i].format(...)
> bl_values[j].format(...)
>
> There is no id token being passed in. To use get_size(),  all format_xxx function prototype need to be redefined (by adding in id token).
>
> I can submit a new patch if you agree my observations.

If we can't pass the size through all the way to make everything fully 
generic, I'd recommend:

a)

Name the field and MAX_BYES constant something more generic so it could 
be re-used for arbitrary fields, e.g. such as:

#define PARAM_TYPE_BINARY_DATA_MAX_SIZE 256

u_int8_t binary[PARAM_TYPE_BINARY_DATA_MAX_SIZE]

b)

When filling in that field, call get_size() at that point in time, and 
validate that the value is equal to sizeof(binary) or 
PARAM_TYPE_BINARY_DATA_MAX_SIZE. At least that way we'll have a check 
that the sizes do actually match.


Or, perhaps we can make the field:

struct {
     size_t len;
     u_int8_t data[PARAM_TYPE_BINARY_DATA_MAX_SIZE];
} binary;

... and hence pass the size around that way?
