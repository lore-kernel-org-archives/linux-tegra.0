From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/3] ARM: tegra: trimslice: enable PCIe when booting
 from device tree
Date: Mon, 04 Jun 2012 11:46:11 -0600
Message-ID: <4FCCF463.3000108@wwwdotorg.org>
References: <1337289674-18581-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337289674-18581-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/17/2012 03:21 PM, Stephen Warren wrote:
> There currently aren't bindings for the Tegra PCIe controller. Work on
> this is in progress, but not yet complete. Manually initialize PCIe when
> booting from device tree, in order to bring DT support to the same
> feature level as board files, which will in turn allow board files to be
> deprecated.
> 
> PCIe hosts the wired Ethernet controller on TrimSlice.
> 
> To support this, add infra-structure to board-dt-tegra20.c for board-
> specific initialization code. Once device tree support for the relevant
> features is in place, this code will be removed.

Applied for 3.6 (the series).
