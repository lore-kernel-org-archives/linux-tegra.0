From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/9] ARM: tegra: add platform suspend support
Date: Wed, 13 Mar 2013 11:34:11 -0600
Message-ID: <5140B893.9010704@wwwdotorg.org>
References: <1363060916-8897-1-git-send-email-josephl@nvidia.com>  <513F82EB.1030407@wwwdotorg.org> <1363154644.3998.140.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363154644.3998.140.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/13/2013 12:04 AM, Joseph Lo wrote:
...
> BTW, I want to mention one thing about PMC DT bindings. Because I can't
> add all of the PMC DT bindings in one time, the PMC is related to too
> many devices to work for runtime PM and power domain control. And some
> wake up sources control for deep sleep mode (LP0). They are still under
> developing for upstream. May I add more bindings for PMC later?

With DT you are supposed to define the complete DT binding for the HW up
front. There have been some hints that incrementally defining bindings
will start to get push-back. How hard is it in this case to simply
define the entire binding right now?

That said, in practice, you can certainly incrementally define bindings
at the moment. The main issue here is to ensure that when you add the
new properties/..., then:

a) You don't change anything that's already there. The old properties
and content must continue to work without modification.

b) For all nodes/properties that are newly required, either there is a
suitable default if they are missing from the DT (as they would be for
DTs written to the old specification), /or/ the new nodes/properties
only enable new features, so that any old DT continues to work fine with
at least as many features as it always did.

If you satisfy those conditions, I believe we can still get away with
incrementally defining bindings. I don't know how long that will last
though.
