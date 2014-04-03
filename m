From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH] Image dependency generator cleanups
Date: Thu, 03 Apr 2014 11:01:24 -0600
Message-ID: <533D93E4.30703@wwwdotorg.org>
References: <1396460585-9178-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396460585-9178-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/02/2014 11:43 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> 1) Remove whitespace from parsed filenames.
> 2) Make image file depend on dependency generator script.
> 3) Provide dummy rules for all dependencies. Without this change, if any
>    dependency is renamed, make will try to build it but won't know how.
>    With the dummy rules in place, make will execute an empty command to
>    build any missing dependencies, which is fine if they've simply been
>    renamed. Any real errors due to incorrect filenames in the current
>    config files will be caught by the cbootimage invocation itself.

Applied.
