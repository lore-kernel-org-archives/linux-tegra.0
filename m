From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH] Use actual U-Boot BSS size for padding when flashing
Date: Tue, 20 May 2014 10:35:58 -0600
Message-ID: <537B846E.1010501@wwwdotorg.org>
References: <1400532140-19224-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400532140-19224-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/19/2014 02:42 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> In flashing mode, tegra-uboot-flasher downloads an image into RAM which
> consists of the U-Boot binary, board DTB, some padding, and the image to
> write into flash. The padding needs to be large enough so that the flash
> image doesn't overlap with U-Boot's BSS at run-time, since the BSS is
> zero'd out at boot, and stores variables that are written to at run-time.
> Any overlap would cause the flash image to be corrupted.
> 
> tegra-uboot-flasher currently uses a guess of 1MB for the required
> padding size. However, when enabling DFU support in U-Boot, the BSS size
> balloons to well over 1MB, thus causing corruption to the flash image.
> Solve this by recording the actual BSS size at build time, and using the
> exact value at flashing time to calculate the padding. Add in an extra
> 4KB of padding just in case the DTB gets larger when adding in the
> flashing commands. Previously, this was also assumed to fit into the
> hard-coded 1MB of pad.

Applied.
