From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH flasher 1/4] Convert build script to argparse
Date: Mon, 17 Jun 2013 10:54:24 -0600
Message-ID: <51BF3F40.8090807@wwwdotorg.org>
References: <1371239544-26165-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371239544-26165-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/14/2013 01:52 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Future patches will add some options. This will be easier with argparse.
> 
> Unfortunately, argparse doesn't support a default sub-command. Hence, the
> shortcut "./build" for "./build build" is no longer supported. There are
> ways to work around this by treating the command name as an optional
> argument rather than sub-commands. However, this limits future
> flexibility, since the fake sub-commands won't be able to accept sub
> command- specific options.

The series is applied.
