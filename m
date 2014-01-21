From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH flasher] Make all paths absolute
Date: Tue, 21 Jan 2014 11:07:48 -0700
Message-ID: <52DEB774.7040201@wwwdotorg.org>
References: <1390256740-15326-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390256740-15326-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/20/2014 03:25 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Convert all file and path names from the command line to absolute paths.
> This helps when running tegra-uboot-flasher out-of-tree with a local
> bootloader or flash image. This is needed, since tegra-uboot-flasher
> cd's to a temporary work directory when executing most commands, which
> causes relative path names to no longer be valid.

Applied.
