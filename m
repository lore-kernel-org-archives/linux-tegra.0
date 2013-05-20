From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 4/5] clk: add CLK_SET_RATE_NO_REPARENT flag
Date: Mon, 20 May 2013 14:44:05 -0600
Message-ID: <519A8B15.4040702@wwwdotorg.org>
References: <1369056507-32521-1-git-send-email-james.hogan@imgtec.com> <1369056507-32521-5-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369056507-32521-5-git-send-email-james.hogan@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Saravana Kannan <skannan@codeaurora.org>, Sascha Hauer <kernel@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, Viresh Kumar <viresh.linux@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Chao Xie <xiechao.mail@gmail.com>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?RW1pbGlvIEzDs3Bleg==?= <emilio@elopez.com.ar>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Joseph Lo <josephl@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Pawel Moll <pawel.moll@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, spear-devel@list.st.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/20/2013 07:28 AM, James Hogan wrote:
> Add a CLK_SET_RATE_NO_REPARENT clock flag, which will prevent muxes
> being reparented during clk_set_rate.
> 
> To avoid breaking existing platforms, all callers of clk_register_mux()
> are adjusted to pass the new flag. Platform maintainers are encouraged
> to remove the flag if they wish to allow mux reparenting on set_rate.

The Tegra parts,
Acked-by: Stephen Warren <swarren@nvidia.com>
