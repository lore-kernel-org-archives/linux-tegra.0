From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: Add stmpe-adc driver to relevant
 devicetrees
Date: Sat, 24 Nov 2018 14:20:58 +0300
Message-ID: <2c7d4caa-4a6e-cea1-d394-51790227d968@gmail.com>
References: <20181123142411.8921-1-dev@pschenker.ch>
 <20181123142411.8921-4-dev@pschenker.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181123142411.8921-4-dev@pschenker.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <dev@pschenker.ch>, jic23@kernel.org, marcel.ziswiler@toradex.com, stefan@agner.ch
Cc: Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: linux-tegra@vger.kernel.org

On 23.11.2018 17:24, Philippe Schenker wrote:
> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> Activate the stmpe-adc driver as found on Apalis/Colibri iMX6/T30 modules
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

Hello Philippe,

Just a very minor comment.. device trees are not for drivers, but for HW description. It will be better to s/driver/DT node/ in both commit name and description.
