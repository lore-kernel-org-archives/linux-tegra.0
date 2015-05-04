From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v4 04/20] clk: tegra: pll: simplify clk_enable_path
Date: Mon, 4 May 2015 13:11:18 -0700
Message-ID: <CANLzEkuR4KPMPc=25D8mKyjdLaSvSa3xyX_ad=j3q_rVu+A-Hw@mail.gmail.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-5-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430757460-9478-5-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> Instead of having multiple similar wrapper functions for
> _clk_pll_[enable|disable], we can simplify it to single
> wrappers and use checks to avoid the logic we don't want to use.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
