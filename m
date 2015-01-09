From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-pinmux-scripts 2/2] add support for Beaver board
Date: Fri, 09 Jan 2015 10:16:19 -0700
Message-ID: <54B00CE3.1060309@wwwdotorg.org>
References: <1420494447-18510-1-git-send-email-dev@lynxeye.de> <1420494447-18510-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420494447-18510-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/05/2015 02:47 PM, Lucas Stach wrote:
> This leaves some pins unconfigured, but is all I could work out
> from the existing U-Boot and Kernel code/DTs.

I've applied the series. I added a note to the top of beaver.board:

> # Note that this data was reverse-engineered from current upstream SW; it is
> # not a complete error-checked NVIDIA-supplied data set. That doesn't mean
> # anything is wrong with the data, simply that it was not generated using the
> # normal flow for NVIDIA reference boards (auto-generation from spreadsheets
> # supplied by NVIDIA syseng).

I hope that's OK.

One thing that might be worth doing: Boot the system you have, test that 
everything works, then fill in all the missing pins/values based on the 
actual register settings in HW (and cross-check the others with what's 
already in this file). At least that would eliminate the warnings from 
./board-to-*.py re: some pins being unconfigured, without changing 
anything about the way the pinmux ends up being programmed.
