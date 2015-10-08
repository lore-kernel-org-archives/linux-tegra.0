From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2 4/4] Add new configuration keyword "ReSignBl"
Date: Thu, 8 Oct 2015 08:35:55 -0600
Message-ID: <56167F4B.3010205@wwwdotorg.org>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-5-git-send-email-jimmzhang@nvidia.com>
 <5615522C.50100@wwwdotorg.org>
 <fcfafb34ac0b43e792291192ddaeb516@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fcfafb34ac0b43e792291192ddaeb516-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/07/2015 04:45 PM, Jimmy Zhang wrote:
> Stephen Warren wrote at Wednesday, October 07, 2015 10:11 AM:
>> On 10/02/2015 02:57 PM, Jimmy Zhang wrote:
>>> This feature is needed in case an image is updated at later stage
>>> after it has been created.
>>>
>>> How to use:
>>>     Add keyword "ReSignBl" to configuration file, for example resign.cfg:
>>>       ReSignBl;
>>>
>>>     Invoke cbootimage to resign image, for example bootloader.bin:
>>>       $ cbootimage -s tegra210 --update resign.cfg bootloader.bin
>>> bootloader.bin-resigned
>>>
>>>     Where bootloader.bin-resigned is the resigned bootloader.bin

>>> diff --git a/src/crypto.c b/src/crypto.c
>>
>>> +int
>>> +sign_bl(build_image_context *context,
>>> +	u_int8_t *bootloader,
>>> +	u_int32_t length,
>>> +	u_int32_t image_instance)
>>> +{
>>> +	int e = 0;
>>> +	u_int8_t  *hash_buffer;
>>> +	u_int32_t  hash_size;
>>> +
>>> +	g_soc_config->get_value(token_hash_size,
>>> +			&hash_size, context->bct);
>>
>> Ah, so there's already a function that can return the size of various objects in
>> the BCT. That will make option (b) in my review of patch 2 much easier then...
>
> Not sure what you mean exactly.

When I reviewed patch 2/4 I proposed 3 options for a change to ensure 
that t210_bct_set_value() wasn't tied to chip-specific RSA parameter 
sizes. Option (b) relied on t210_bct_set_value() calling into an 
SoC-specific function to retrieve the RSA parameter sizes, which might 
have meant creating new infra-structure to allow such a call. However, 
given that g_soc_config->get_value() already exists, and is already used 
by core code to retrieve the SoC-specific size of some objects, it turns 
out that implementing option (b) should actually be trivial. Hence, it's 
the best option.
