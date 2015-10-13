From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v5 1/5] Add support for update pubkey and
 rsa-pss signatures
Date: Tue, 13 Oct 2015 10:19:12 -0600
Message-ID: <561D2F00.7000306@wwwdotorg.org>
References: <1444441574-17205-1-git-send-email-jimmzhang@nvidia.com>
 <1444441574-17205-2-git-send-email-jimmzhang@nvidia.com>
 <561C38E1.6000103@wwwdotorg.org>
 <6bc0f021797c4eab93749693af343d5a@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6bc0f021797c4eab93749693af343d5a-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/12/2015 08:02 PM, Jimmy Zhang wrote:
>
>
>> -----Original Message-----
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Monday, October 12, 2015 3:49 PM
>> To: Jimmy Zhang
>> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [cbootimage PATCH v5 1/5] Add support for update pubkey and
>> rsa-pss signatures
>>
>> On 10/09/2015 07:46 PM, Jimmy Zhang wrote:
>>> Create new configuration keywords:
>>>      RsaKeyModulusFile: pubkey modulus
>>>      RsaPssSigBlFile:   bootloader rsa pss signature
>>>      RsaPssSigBctFile:  bct rsa pss signature
>>>
>>> Sample Configuration file update_bl_sig.cfg
>>>      RsaKeyModulusFile = pubkey.mod;
>>>      RsaPssSigBlFile = bl.sig;
>>>
>>> where pubkey.mod and bl.sig are files that contain the public key
>>> modulus and bootloader's rsa-pss signature respectively.
>>>
>>> public key modulus and signature are created through utilities outside
>>> cbootimage.
>>>
>>> Command line example:
>>>    $ cbootimage -s tegra210 -u update_bl_sig.cfg image.bin
>>> image.bin-bl-signed
>>>
>>> Above three new keywords added in this CL are only implemented support
>>> for T210.
>>
>> I'd like to see a changelog per patch so I don't have to refer back to the cover
>> letter each time.
>>
>
> OK
>
>>> diff --git a/src/crypto.c b/src/crypto.c
>>
>>> +void
>>> +swap_endianness(
>>
>> Nit: It's more like "byte order" (serialization) rather than endianness,
>> although they're related concepts.
>
> This is the function name used by tegrasign. I am open if you have a better name. The reason for the swap because the string actually is a 256 byte long number. Tegra soc handles a number by little endian byte order.

reverse_byte_order()?

BTW, does cbootimage operate correctly if run in a big-endian host?
