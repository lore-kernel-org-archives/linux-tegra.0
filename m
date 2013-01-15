From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/3] ARM: DT: tegra: add DT entry for KBC controller
Date: Tue, 15 Jan 2013 11:59:08 -0700
Message-ID: <50F5A6FC.4090104@wwwdotorg.org>
References: <1357911185-11048-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1357911185-11048-1-git-send-email-ldewangan@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 01/11/2013 06:33 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra SoCs have the matrix keyboard controller which
> supports 16x8 type of matrix. The number of rows and columns
> are configurable.
> 
> Add DT entry for KBC controller.

Applied to Tegra's for-3.9/dt branch.

I added the required clocks property for this patch to work with
Prashant's common clock framework port, although it's commented out so
far, until the CCF rework is actually applied.
