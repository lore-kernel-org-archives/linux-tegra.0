From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: tegra: delete unneeded of_node_put
Date: Mon, 12 Oct 2015 11:52:55 -0700
Message-ID: <20151012185255.GC26883@codeaurora.org>
References: <1444412861-2580-1-git-send-email-Julia.Lawall@lip6.fr>
 <1444412861-2580-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444412861-2580-3-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-clk-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, kernel-janitors@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-tegra@vger.kernel.org

On 10/09, Julia Lawall wrote:
> for_each_child_of_node performs an of_node_put on each iteration, so
> putting an of_node_put before a continue results in a double put.
> 
> The semantic match that finds this problem is as follows
> (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> iterator name for_each_child_of_node;
> @@
> 
>  for_each_child_of_node(root, child) {
>    ... when != of_node_get(child)
> *  of_node_put(child);
>    ...
> *  continue;
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
