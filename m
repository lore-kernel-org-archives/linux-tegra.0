From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: add keyword "tegra" to Tegra section
Date: Fri, 08 Feb 2013 17:47:18 -0700
Message-ID: <51159C96.5080505@wwwdotorg.org>
References: <1360353891-24210-1-git-send-email-swarren@wwwdotorg.org> <1360370419.13487.8.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360370419.13487.8.camel@joe-AO722>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/08/2013 05:40 PM, Joe Perches wrote:
> On Fri, 2013-02-08 at 13:04 -0700, Stephen Warren wrote:
>> (?<!in)tegra
> 
> This doesn't work well.   It matches too many
> words like integral.

Hmmm. That's exactly what the (?<!in) negative look-behind assertion is
attempting to avoid. It works fine here. Is there some dependency on
Perl version or something? My Perl version is v5.14.2.

> I suggest
> 
> K:	(?:\btegra\b|\bTEGRA_)
> 
