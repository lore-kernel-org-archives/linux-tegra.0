From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [cbootimage PATCH] Add man pages
Date: Thu, 8 Oct 2015 11:19:18 -0700
Message-ID: <20151008181918.GA32353@nvidia.com>
References: <1444257480-24964-1-git-send-email-amartin@nvidia.com>
 <5616B0D2.5080709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5616B0D2.5080709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 08, 2015 at 12:07:14PM -0600, Stephen Warren wrote:
> On 10/07/2015 04:38 PM, Allen Martin wrote:
> >Add man pages for cbootimge(1) and bct_dump(1)
> >+.SH AUTHOR
> >+Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> I don't recall; is the man page author tag supposed to reflect the
> author of the tool or the author of the man page?
> 

Good question, from "man 7 man-pages":

AUTHORS       lists authors of the documentation or program.
       Use of an AUTHORS section is strongly discouraged...

Sounds like I should just remove it
