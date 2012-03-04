From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: tegra: Enable CPUIdle on Tegra20
Date: Sun, 4 Mar 2012 10:51:55 -0800
Message-ID: <20120304185155.GA363@quad.lixom.net>
References: <1330014056-26125-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BD8BC9AB@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BC9AB@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "Russell King - ARM Linux (linux@arm.linux.org.uk)" <linux@arm.linux.org.uk>, "Nicolas Pitre (nico@fluxnic.net)" <nico@fluxnic.net>, Peter De Schrijver <pdeschrijver@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 23, 2012 at 09:25:34AM -0800, Stephen Warren wrote:
> Peter De Schrijver wrote at Thursday, February 23, 2012 9:21 AM:
> > As the LP3 code also works for Tegra20, we can enable cpuidle for Tegra20.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Acked-by: Stephen Warren <swarren@nvidia.com>
> Tested-by: Stephen Warren <swarren@nvidia.com>
> 
> Note that the commit which added this line appears to have been made in
> Nicolas's idle branch, which was merged into Russell's for-armsoc branch.
> This presumably impacts the path through which this fix should get merged.
> 
> (hence leaving the patch below for Nicolas/Russell to see)

Thanks, applied.


-Olof
