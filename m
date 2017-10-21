From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/4] clk: tegra: check BPMP response return code
Date: Sat, 21 Oct 2017 07:10:38 -0700
Message-ID: <20171021141038.GB15990@codeaurora.org>
References: <cover.1504776489.git.talho@nvidia.com>
 <6a69e270519fd1c7a12a335053bf59671abc3c4b.1504776489.git.talho@nvidia.com>
 <20171017103736.GA30589@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171017103736.GA30589@ulmo>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Timo Alho <talho@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/17, Thierry Reding wrote:
> On Thu, Sep 07, 2017 at 12:31:02PM +0300, Timo Alho wrote:
> > Check return code in BPMP response message(s). The typical error case
> > is when clock operation is attempted with invalid clock identifier.
> > 
> > Also remove error print from call to clk_get_info() as the
> > implementation loops through range of all possible identifier, but the
> > operation is expected error out when the clock id is unused.
> > 
> > Signed-off-by: Timo Alho <talho@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-bpmp.c | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> Hi Mike, Stephen,
> 
> do you mind if I pick this up into the Tegra tree? It has a build
> dependency on patch 1/4.
> 
> I only now realized that you guys weren't on Cc, hence quoting in
> full.
> 

No worries

Acked-by: Stephen Boyd <sboyd@codeaurora.org>


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
