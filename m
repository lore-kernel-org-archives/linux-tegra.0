From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm64: tegra: add CPU cache topology for Tegra186
Date: Tue, 4 Jun 2019 10:05:54 +0100
Message-ID: <20190604090554.GD23250@e107533-lin.cambridge.arm.com>
References: <20190604023535.7115-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190604023535.7115-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 04, 2019 at 10:35:35AM +0800, Joseph Lo wrote:
> Tegra186 has two CPU clusters with its own cache hierarchy. This patch
> adds them with the cache information of each of the CPUs.
> 

Please add geometry information if you prefer to expose the same to the
user-space. We removed support to read the system registers to fetch
these information. In-fact it was for one of the Tegra platforms that
geometry in those registers don't match the actual values, at-least
that was the argument to drop the support for the same.

--
Regards,
Sudeep
