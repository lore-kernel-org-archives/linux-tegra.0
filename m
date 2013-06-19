From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v2 1/2] mfd: tps65910: Fix crash in i2c_driver .probe
Date: Wed, 19 Jun 2013 12:06:11 +0200
Message-ID: <20130619100611.GZ7161@zurbaran>
References: <1371550481-28126-1-git-send-email-ttynkkynen@nvidia.com>
 <1371550481-28126-2-git-send-email-ttynkkynen@nvidia.com>
 <20130619081859.GA22998@laptop>
 <20130619082740.GT7161@zurbaran>
 <20130619100020.GC2950@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130619100020.GC2950@katana>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Lee Jones <lee.jones@linaro.org>, Tuomas Tynkkynen <ttynkkynen@nvidia.com>, Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-tegra@vger.kernel.org

Hi Wolfram,

On Wed, Jun 19, 2013 at 12:00:20PM +0200, Wolfram Sang wrote:
> > > Applied with Stephen's Reviewed-by, thanks.
> > According to Wolfgang, this is not needed as he will revert the i2c
> > commits that are causing those crashes.
> > I would not take it for now.
> 
> "Wolfram", please ;) Otherwise correct.
Apologies, it seems I have issues with first names today...

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
