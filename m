From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH V2 1/4] Add support for production devices
 secured with PKC
Date: Tue, 15 Mar 2016 10:20:32 -0600
Message-ID: <56E83650.507@wwwdotorg.org>
References: <1457744552-30966-1-git-send-email-jimmzhang@nvidia.com>
 <1457744552-30966-2-git-send-email-jimmzhang@nvidia.com>
 <56E70576.3050000@wwwdotorg.org>
 <f0f79d636da2412f8dad980e4114a4c8@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f0f79d636da2412f8dad980e4114a4c8-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/14/2016 06:51 PM, Jimmy Zhang wrote:
> Stephen Warren wrote atMonday, March 14, 2016 11:40 AM:
>> On 03/11/2016 06:02 PM, Jimmy Zhang wrote:
>>> From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>>
>>> Add the support code needed to sign the RCM messages with RSA-PSS as
>>> needed to communicate with secured production devices. This mode is
>>> enabled by passing a key via the --pkc command line argument. If such
>>> a key is set the RCM messages will be signed with it as well as the
>>> bootloader.

>>> diff --git a/src/rsa-pss.cpp b/src/rsa-pss.cpp
>>
>>> +extern "C" int rsa_pss_sign_file(const char *key_file, const char
>> *msg_file,
>>> +			unsigned char *sig_buf)
>>
>>> +		int length = signature.length();
>>> +		// error check
>>> +		if (length != RCM_RSA_SIG_SIZE)
>>> +			throw std::length_error("incorrect rsa key length");
>>
>> I think that check is required in rsa_pss_sign() too.
>
> I checked key's modulus length there. Once it passes, key's length should be correct.

Aren't the two functions essentially identical, the only difference 
being that one signs an in-memory buffer and the other signs data read 
from a file. As such, I don't see why they would be coded any 
differently, apart from the file IO portion (and indeed, why doesn't 
rsa_pss_sign_file() simply read file data into memory, then call the 
other function?
