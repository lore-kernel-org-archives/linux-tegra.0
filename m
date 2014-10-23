From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1 1/5] mfd: tps65910: Convert ti,system-power-controller
 DT property to poweroff-source
Date: Thu, 23 Oct 2014 11:12:30 +0300
Message-ID: <20141023081230.GK32045@tbergstrom-lnx.Nvidia.com>
References: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Romain Perier <romain.perier@gmail.com>
Cc: sameo@linux.intel.com, lee.jones@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, grant.likely@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, broonie@kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 22, 2014 at 03:26:23PM +0000, Romain Perier wrote:
> No longer use custom property to define poweroff capability, use the standard
> DT property instead.
> 

This breaks DT ABI stability right? An existing device tree using ti,system-power-controller won't work anymore after this patch right? I don't think that's acceptable.

CHeers,

Peter.
