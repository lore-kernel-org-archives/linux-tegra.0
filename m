From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: Multi-parent IRQ domains
Date: Fri, 14 Sep 2018 11:44:06 +0100
Message-ID: <20180914104406.GA28182@e107155-lin>
References: <20180913155945.GA19903@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180913155945.GA19903@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 13, 2018 at 05:59:45PM +0200, Thierry Reding wrote:
> Hi everyone,
>
> I've been trying to implement a feature on recent Tegra chips that's
> called "wake events".

By recent, is it same to assume PSCI based system ? And the GIC is power
managed by PSCI ?

--
Regards,
Sudeep
