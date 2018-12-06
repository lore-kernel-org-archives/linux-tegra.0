From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V3] arm64: Don't flush tlb while clearing the accessed bit
Date: Thu, 6 Dec 2018 19:18:51 +0000
Message-ID: <20181206191850.GC20796@arm.com>
References: <1540805158-618-1-git-send-email-amhetre@nvidia.com>
 <20181029105515.GD14127@arm.com>
 <BN7PR12MB2708B742FD3448589AD0F259CFF30@BN7PR12MB2708.namprd12.prod.outlook.com>
 <BYAPR12MB27129A4EE7BBF57B1CAB5094CFAE0@BYAPR12MB2712.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR12MB27129A4EE7BBF57B1CAB5094CFAE0@BYAPR12MB2712.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Van Brunt <avanbrunt@nvidia.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sachin Nikam <Snikam@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi Alex,

Thanks for running these tests and providing the in-depth analysis.

On Mon, Dec 03, 2018 at 09:20:25PM +0000, Alexander Van Brunt wrote:
> > If we roll a TLB invalidation routine without the trailing DSB, what sort of
> > performance does that get you?
> 
> It is not as good. In some cases, it is really bad. Skipping the invalidate was
> the most consistent and fast implementation.

My problem with that is it's not really much different to just skipping the
page table update entirely. Skipping the DSB is closer to what is done on
x86, where we bound the stale entry time to the next context-switch.

Given that I already queued the version without the DSB, we have the choice
to either continue with that or to revert it and go back to the previous
behaviour. Which would you prefer?

Will
