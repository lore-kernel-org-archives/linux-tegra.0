From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH v8 3/3] arm/tegra: device tree support for ventana board
Date: Tue, 11 Oct 2011 09:36:04 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE19AB0@HQMAIL01.nvidia.com>
References: <1318329909-32601-1-git-send-email-pdeschrijver@nvidia.com>
	<1318329909-32601-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1318329909-32601-4-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Erik Gilling <konkers@android.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Tuesday, October 11, 2011 4:45 AM:
> Change-Id: I5ed18750e6a8aa3242dae4bcd7165cfd819356d2

You probably want to remove that.

...
> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
...
> +	if (i == ARRAY_SIZE(pinmux_configs))
> +		WARN(1, "Unknown platform! Pinmuxing not initialized\n");

Sorry to keep picking on this, but shouldn't that be simply:

		WARN(i == ARRAY_SIZE(pinmux_configs),
			"Unknown platform! Pinmuxing not initialized\n");

-- 
nvpublic
