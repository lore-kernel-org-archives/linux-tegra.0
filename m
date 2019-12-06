From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 09/15] ASoC: tegra: Add fallback for audio mclk
Date: Fri, 6 Dec 2019 18:56:00 +0100
Message-ID: <20191206175600.GB186026@kroah.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <e94e56bc-2b4c-5d95-002a-073c9272537d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e94e56bc-2b4c-5d95-002a-073c9272537d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 06, 2019 at 09:49:49AM -0800, Sowjanya Komatineni wrote:
> Thanks Greg.
> 
> Sorry, Will send this patch separately (out of this series) with stable tag
> to get this applied to stable kernels once review is done for this series.

Why not just properly add the tag in the original patch when it gets
merged?  That's how everyone else does it :)

This isn't new, it's been happening this way for 12+ years now...

thanks,

greg k-h
