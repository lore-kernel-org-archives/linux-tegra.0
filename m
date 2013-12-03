From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 01/31] ARM: tegra: add missing clock documentation to
 DT bindings
Date: Tue, 03 Dec 2013 11:36:19 -0700
Message-ID: <529E24A3.3080804@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-2-git-send-email-swarren@wwwdotorg.org> <20131129114900.GN22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131129114900.GN22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2013 04:49 AM, Thierry Reding wrote:
> On Fri, Nov 15, 2013 at 01:53:56PM -0700, Stephen Warren wrote:
...
>> +  - clock-names : Must include the following entries:
> 
> One other thing I noticed here is that you use a space between the 
> property name and the :. None of the other properties have that, so
> it looks somewhat out of place. The same is true for other
> bindings, but there seem to be inconsistencies in some places
> anyway, so perhaps we don't care? Well, I do care, don't know about
> you. =)

I've fixed those up locally. I assume you don't want a repost for such
a trivial change? I'll double-check the "resets" patch for the same issue.
