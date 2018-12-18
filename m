From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V3 08/20] clk: tegra: dfll: round down voltages based on
 alignment
Date: Tue, 18 Dec 2018 10:41:51 -0800
Message-ID: <154515851110.238328.11710971689713709806@swboyd.mtv.corp.google.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-9-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181218091232.23532-9-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Joseph Lo (2018-12-18 01:12:20)
> When generating the OPP table, the voltages are round down with the
> alignment from the regulator. The alignment should be applied for
> voltages look up as well.
> 
> Based on the work of Penny Chiu <pchiu@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
