From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH] Bump to version 1.2
Date: Wed, 28 Aug 2013 08:47:29 -0600
Message-ID: <521E0D81.5010108@wwwdotorg.org>
References: <1377628366-25039-1-git-send-email-swarren@wwwdotorg.org> <20130828063715.GB5141@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130828063715.GB5141@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/28/2013 12:37 AM, Thierry Reding wrote:
> On Tue, Aug 27, 2013 at 12:32:46PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> Create a release that includes Tegra124 support.
>> 
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- 
>> configure.ac | 2 +- 1 file changed, 1 insertion(+), 1
>> deletion(-)
>> 
>> diff --git a/configure.ac b/configure.ac index 9b83a21..2d166c5
>> 100644 --- a/configure.ac +++ b/configure.ac @@ -2,7 +2,7 @@ #
>> Process this file with autoconf to produce a configure script.
>> 
>> AC_PREREQ([2.67]) -AC_INIT([cbootimage], [1.1],
>> [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]) +AC_INIT([cbootimage], [1.2],
>> [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]) AM_INIT_AUTOMAKE 
>> AC_CONFIG_SRCDIR([src/cbootimage.c]) 
>> AC_CONFIG_HEADERS([config.h])
> 
> I wonder, do we have any place where we can upload tarballs so
> that distributions can grab them for packaging?

Not at present. It looks like github automatically implements this for
tags. Perhaps we should think about moving the repos there, since we
already have some on github.
