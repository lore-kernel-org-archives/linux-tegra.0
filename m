From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/9] ARM: tegra: add platform suspend support
Date: Wed, 13 Mar 2013 22:43:52 -0600
Message-ID: <51415588.7080403@wwwdotorg.org>
References: <1363060916-8897-1-git-send-email-josephl@nvidia.com>  <513F82EB.1030407@wwwdotorg.org>  <1363154644.3998.140.camel@jlo-ubuntu-64.nvidia.com>  <5140B893.9010704@wwwdotorg.org> <1363224385.3308.8.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363224385.3308.8.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/13/2013 07:26 PM, Joseph Lo wrote:
> On Thu, 2013-03-14 at 01:34 +0800, Stephen Warren wrote:
>> On 03/13/2013 12:04 AM, Joseph Lo wrote:
>> ...
>>> BTW, I want to mention one thing about PMC DT bindings. Because I can't
>>> add all of the PMC DT bindings in one time, the PMC is related to too
>>> many devices to work for runtime PM and power domain control. And some
>>> wake up sources control for deep sleep mode (LP0). They are still under
>>> developing for upstream. May I add more bindings for PMC later?
>>
>> With DT you are supposed to define the complete DT binding for the HW up
>> front. There have been some hints that incrementally defining bindings
>> will start to get push-back. How hard is it in this case to simply
>> define the entire binding right now?
>>
> There are still two main features for PMC that we need to define
> bindings/properties in DT. One is power main the other wake up source.
> But we are not there yet. Because I don't have drivers to verify them is
> enough or not. If I add all the bindings right now, I believe it will be
> modify later.

Since the DT is supposed to be a representation of the HW, and not a
representation of what a particular driver needs, I'm not sue why you'd
need to be able to test a driver before you could design a DT binding.
