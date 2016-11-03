From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V3 2/6] clk: tegra: add TEGRA30_CLK_NOR to init table
Date: Thu, 3 Nov 2016 13:45:55 +0000
Message-ID: <cf378096-26ca-33d2-2b51-a388aa080b3b@nvidia.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
 <1477576872-2665-3-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477576872-2665-3-git-send-email-mirza.krak@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mirza Krak <mirza.krak@gmail.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, linux@armlinux.org.uk, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 27/10/16 15:01, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>
> Add TEGRA30_CLK_NOR to init table and set default rate to 127 MHz which
> is max rate.
>
> The maximum rate value of 127 MHz is pulled from the downstream L4T
> kernel.
>
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
