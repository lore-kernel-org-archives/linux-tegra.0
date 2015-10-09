From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 5/5] Add two sample scripts to do rsa
 signing for T210 bootimage
Date: Thu, 8 Oct 2015 20:09:16 -0600
Message-ID: <561721CC.9030307@wwwdotorg.org>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
 <1444333109-3671-7-git-send-email-jimmzhang@nvidia.com>
 <5616D8CA.2040209@wwwdotorg.org>
 <797766912b984b9d840369e86e7b2637@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <797766912b984b9d840369e86e7b2637-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/08/2015 08:00 PM, Jimmy Zhang wrote:
> Stephen Warren wrote at Thursday, October 08, 2015 1:58 PM:
>> On 10/08/2015 01:38 PM, Jimmy Zhang wrote:
>>> sign.sh runs openssl and other linux utilities to generate rsa-pss
>>> signatures for a prebuilt bootimage and inject signatures and rsa
>>> modulus into bct directly.
>>>
>>> Syntax: sign.sh <bootimage> <rsa_key.pem>
>>>
>>> sign-by-update.sh is similar to sign.sh. The difference is the
>>> signatures update are done by cbootimage with configuration keywords
>>> "RsaKeyModulusFile", "RsaPssSigBlFile", and "RsaPssSigBctFile".
>>> Comparing to sign.sh, this script is relatively simple to be ported to
>>> T124/T114.
>>>
>>> Syntax: sign-by-update.sh <bootimage> <rsa_key.pem>

>>> diff --git a/sign-by-update.sh b/sign-by-update.sh
>>
>> Let's put these example files in an examples directory or something like that.
>>
>> Should we update the Makefile to install the examples into some doc
>> directory?
> 
> I am not sure how to change Makefile.

I'm sure Allen can give you an example quickly, although just having the
files in the source distribution (in a sub-dir) is probably fine for now.

>>> +$DD bs=1 if=$KEY_FILE.mod of=$KEY_FILE.mod.tmp skip=8 count=512
>>
>> I'd suggest using cut for that in case the prefix changes; `cut -d= f2`.
> 
> Not sure how to use 'cut'. Instead, will use 'sed'

You can can just use the cut command I gave, this maps to this as the
entire replacement for dd:

cut -d= -f2 < $KEY_FILE.mod > $KEY_FILE.mod.tmp
