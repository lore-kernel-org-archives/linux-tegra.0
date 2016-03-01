From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2] Add support for production devices secured
 with PKC
Date: Tue, 1 Mar 2016 10:32:53 -0700
Message-ID: <56D5D245.3000204@wwwdotorg.org>
References: <1456768181-12983-1-git-send-email-alban.bedel@avionic-design.de>
 <fbd256251e014b23a189337a7d251da0@HQMAIL103.nvidia.com>
 <20160301121240.596c664c@avionic-0020>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160301121240.596c664c@avionic-0020>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/01/2016 04:12 AM, Alban Bedel wrote:
> On Mon, 29 Feb 2016 23:03:01 +0000
> Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> Alban,
>>
>> First of all, I believe the code your added here should and will work.
>> However, it is probably purely coincident that I was adding similar
>> functions as requested by Avionic Design (AD) in the last a few weeks.
>> I think we could merge both approaches and result in one best
>> solution.
>
> Up to yesterday what I did was only based on guess work, it was enough
> to use RCM, but loading the bootloader failed. Now we finally got access
> to (part of) the miniloader source and I was able to pin point the
> missing piece to start the bootloader. The miniloader need the
> bootloader signature before the bootloader binary when in PKC mode.
> I added that and I was finally able to bootstrap my fused board.
>
>> The main differences between your and mine are:
>> 1. When to sign.
>>      My solution is to separate signing and flashing. Ie, signing can be
>> done at a secure server and flashing at non-secure factory. During
>> flashing, only signed RCM messages and bootloader are needed. No pkc
>> private key file is required to be present at factory. This private
>> key management feature is also requested by AD. Your solution requires
>> the rsa key file being present when downloading flasher.
>
> Yes, this is currently not suited for production.

Given that, I think I'll ignore this patch series for now. It's typical 
to mark such patches "RFC" in the email subject to indicate that they 
shouldn't be applied. Hopefully you and Jimmy can work together to 
combine your work and post a production-ready patch set?
