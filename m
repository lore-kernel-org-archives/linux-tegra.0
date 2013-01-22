From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [v3 2/2] ARM: tegra: Skip scu_enable(scu_base) if not Cortex
 A9
Date: Tue, 22 Jan 2013 11:49:59 -0700
Message-ID: <50FEDF57.1060204@wwwdotorg.org>
References: <1358833924-24535-1-git-send-email-hdoyu@nvidia.com> <1358833924-24535-2-git-send-email-hdoyu@nvidia.com> <50FEDC0B.7050604@wwwdotorg.org> <20130122184633.GI2153@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130122184633.GI2153@mudshark.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Hiroshi Doyu <hdoyu@nvidia.com>, Russell King <linux@arm.linux.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>, "olof@lixom.net" <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 01/22/2013 11:46 AM, Will Deacon wrote:
> Hi Stephan,
> 
> On Tue, Jan 22, 2013 at 06:35:55PM +0000, Stephen Warren wrote:
>> On 01/21/2013 10:52 PM, Hiroshi Doyu wrote:
>>> Skip scu_enable(scu_base) if CPU is not Cortex A9 with SCU.
>>
>> Will, is your for-next/perf branch stable; can I pull it into a branch
>> destined for arm-soc? Background below:
> 
> I'm going to send a pull request to Russell tomorrow using my for-rmk/perf
> branch, so *that* is stable. You might, however, want to wait for Russell to
> push that out because it's also needed for kvm and, as such, will need to
> be published anyway.
> 
> Sound ok?

I'm assuming rmk's branch will be a stable base, so that sounds great,
thanks.
