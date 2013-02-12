From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V4 1/2] get_maintainer: allow keywords to match filenames
Date: Tue, 12 Feb 2013 10:22:22 -0800
Message-ID: <1360693342.5128.39.camel@joe-AO722>
References: <1360629574-23989-1-git-send-email-swarren@wwwdotorg.org>
	 <1360649875.5128.18.camel@joe-AO722> <511A8743.9010408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <511A8743.9010408-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2013-02-12 at 11:17 -0700, Stephen Warren wrote:
> On 02/11/2013 11:17 PM, Joe Perches wrote:
> > If the -f pattern is a single file,
> > get_maintainer reads that file content and then
> > matches any K: patterns.
> > 
> > When the -f pattern is a directory, it doesn't.
> 
> Yes, I guess that's true; I had convinced myself that "file" wasn't
> accurate since "-f directory/" didn't scan the files within that
> directory tree, but as you say "-f file" does scan the file content.
> 
> BTW, given I'm adding "filename" to the list, I intend to change the
> existing "file" to "file content" to be clear. Are you OK with that?

Sure.
