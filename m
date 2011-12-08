From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 4/8] arm/dt: tegra: Add Tegra APB DMA device tree
 binding
Date: Wed, 7 Dec 2011 16:13:05 -0800
Message-ID: <20111208001305.GE12945@quad.lixom.net>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
 <1323296033-28730-8-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323296033-28730-8-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 07, 2011 at 03:13:46PM -0700, Stephen Warren wrote:
> Document binding, and add the node to tegra20.dtsi.
> 
> The driver isn't actually instantiated from this node yet, but the I2S
> binding will rely on being able to refer to the APB DMA node using a
> phandle.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


Thanks, applied to for-3.3/soc


-Olof
