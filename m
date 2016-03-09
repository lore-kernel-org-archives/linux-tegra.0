From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 2/4] Add option --ml_rcm <rcm_ml_blob>
Date: Wed, 9 Mar 2016 10:35:37 -0700
Message-ID: <56E05EE9.5000406@wwwdotorg.org>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-3-git-send-email-jimmzhang@nvidia.com>
 <56DDE16A.8030809@wwwdotorg.org>
 <efa82104830b489a8ebe29238bb48034@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <efa82104830b489a8ebe29238bb48034-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/08/2016 06:21 PM, Jimmy Zhang wrote:
> Stephen Warren wrote at Monday, March 07, 2016 12:16 PM:
>> On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
>>> This option along with "--pkc <keyfile>" allows user to generate
>>> signed query version rcm, miniloader rcm and signed bootloader
>>> (flasher). With these signed blob, user will then be able to run
>>> tegrarcm on a fused system without keyfile.
>>
>> That says "without keyfile", yet ...
>
> Andrew helped me updating commit messages as below:
>
> This option along with "--pkc <keyfile>" allows user to generate
> signed query version rcm, miniloader rcm and signed bootloader
>   (flasher). With the signed blob, user will then be able to later run
> tegrarcm on a fused system without needing the actual keyfile.

I'd suggest just the following; that uses "signed blob" without actually 
mentioning that any such thing exists.

This feature allows generation of a signed blob that can later be used 
to communicate with a PKC-enabled Tegra device without access to the 
PKC. The --pkc option is required when generating the blob.
