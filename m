From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 00/16] big.LITTLE low-level CPU and cluster power
 management
Date: Wed, 16 Jan 2013 16:02:42 +0000
Message-ID: <20130116160242.GB31318@arm.com>
References: <1357777251-13541-1-git-send-email-nicolas.pitre@linaro.org>
 <1358157392.19304.243.camel@jlo-ubuntu-64.nvidia.com>
 <alpine.LFD.2.02.1301140849020.6300@xanadu.home>
 <1358217848.8513.14.camel@jlo-ubuntu-64.nvidia.com>
 <alpine.LFD.2.02.1301151140550.6300@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1301151140550.6300@xanadu.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 15, 2013 at 04:44:23PM +0000, Nicolas Pitre wrote:
> On Tue, 15 Jan 2013, Joseph Lo wrote:
> > So do you have a plan to make it become a generic framework in this
> > series or later work?
> 
> It is already generic, except for the name.  In other words, you could 
> start using this code already.
> 
> I'm still debating a good substitute for the bL_ prefix in this series 
> to give it the appearance of generic code.

mc_?

-- 
Catalin
