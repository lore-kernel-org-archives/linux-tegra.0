From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: tegra: select SPARSE_IRQ
Date: Mon, 15 Oct 2012 12:30:52 -0600
Message-ID: <507C565C.7000101@wwwdotorg.org>
References: <1348090279-22631-1-git-send-email-swarren@wwwdotorg.org> <1348090279-22631-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348090279-22631-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/19/2012 03:31 PM, Stephen Warren wrote:
> SPARSE_IRQ is required for single zImage support.
> 
> With this enabled, we can delete <mach/irqs.h>. This requires removing
> one unnecessary include of that file, and hard-coding the PCIe IRQ into
> the PCIe driver. This is a hack that will be dealt with as part of
> converting the PCIe driver into a true DT-supporting driver.

I have applied this series to Tegra's for-3.8/single-zimage branch.

I'm not sure yet if Tegra will actually be able to be part of single
zImage in 3.8, but this branch will certainly host a fair few changes to
get it very close at least.
