From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 0/8] clk: Minor cleanups
Date: Tue, 5 May 2015 22:56:53 -0700
Message-ID: <20150506055653.GF10871@codeaurora.org>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430196383-9190-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/28, Krzysztof Kozlowski wrote:
> Hi,
> 
> 
> Changes since v1
> ================
> 1. Rebase on next-20150427 and Sascha Hauer's:
>    clk: make strings in parent name arrays const [1]
> 2. Add patch "clk: tegra: Fix inconsistent indenting".
> 
> 
> Description and dependencies
> ============================
> Small cleanups for different clock drivers.
> 
> The first three patches are independent.
> 
> Rest of the patches (these related to constifying parent names,
> including the change for MIPS) depend on the "clk: make strings in
> parent name arrays const" from Sascha Hauer [1].
> 
> 
> Tested on Arndale Octa (Exynos5420) and Trats2 (Exynos4412). Other
> drivers (and MIPS related) only compile tested plus some static
> checkers.
> 
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg413763.html
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (8):
>   clk: rockchip: Staticize file-scope declarations
>   clk: exynos: Staticize file-scope declarations
>   clk: tegra: Fix inconsistent indenting
>   clk: tegra: Fix duplicate const for parent names
>   clk: cdce706: Constify parent names in clock init data
>   clk: sirf: Constify parent names in clock init data
>   clk: ls1x: Fix duplicate const for parent names
>   MIPS: Alchemy: Remove unneeded cast removing const

Applied 1,2,5,6,7 to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
