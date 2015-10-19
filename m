From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v5 1/5] Add support for update pubkey and
 rsa-pss signatures
Date: Mon, 19 Oct 2015 10:28:05 -0600
Message-ID: <56251A15.4040502@wwwdotorg.org>
References: <1444441574-17205-1-git-send-email-jimmzhang@nvidia.com>
 <1444441574-17205-2-git-send-email-jimmzhang@nvidia.com>
 <561C38E1.6000103@wwwdotorg.org>
 <6bc0f021797c4eab93749693af343d5a@HQMAIL103.nvidia.com>
 <bc8eeffeced34fb1b912850b61a161f0@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bc8eeffeced34fb1b912850b61a161f0-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "'linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2015 06:21 PM, Jimmy Zhang wrote:
> Jimmy Zhang wrote at Monday, October 12, 2015 7:02 PM
>> Stephen Warren wrote at Monday, October 12, 2015 3:49 PM:
>>> On 10/09/2015 07:46 PM, Jimmy Zhang wrote:
>>>> Create new configuration keywords:
>>>>      RsaKeyModulusFile: pubkey modulus
>>>>      RsaPssSigBlFile:   bootloader rsa pss signature
>>>>      RsaPssSigBctFile:  bct rsa pss signature
>>>>
>>>> Sample Configuration file update_bl_sig.cfg
>>>>      RsaKeyModulusFile = pubkey.mod;
>>>>      RsaPssSigBlFile = bl.sig;
>>>>
>>>> where pubkey.mod and bl.sig are files that contain the public key
>>>> modulus and bootloader's rsa-pss signature respectively.
>>>>
>>>> public key modulus and signature are created through utilities
>>>> outside cbootimage.
>>>>
>>>> Command line example:
>>>>    $ cbootimage -s tegra210 -u update_bl_sig.cfg image.bin
>>>> image.bin-bl-signed
>>>>
>>>> Above three new keywords added in this CL are only implemented
>>>> support for T210.

>>>> diff --git a/src/crypto.c b/src/crypto.c
>>>
>>>> +void
>>>> +swap_endianness(
...
>> This is the function name used by tegrasign. I am open if you have a better
>> name. The reason for the swap because the string actually is a 256 byte long
>> number. Tegra soc handles a number by little endian byte order.
>>
>>>> +	u_int8_t *out,
>>>> +	u_int8_t *in,
>>>
>>> Nit: You could make "in" const to since it's not written.
>>>
>>
>> OK.
>
> Actually this function allows output pointing to input, ie, reversing itself in byte order.

Presumably however, the "in" pointer is only used for reads and the 
"out" point is only used for writes, so "in" can still be const?
