From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH 3/3] arm/dt: tegra: add dts file for paz00
Date: Mon, 31 Oct 2011 23:20:42 +0100
Message-ID: <2757750.NnzM46gx6f@ax5200p>
References: <cover.1320088857.git.marvin24@gmx.de>
	<855f09f77c03a9f081818a03effdbd3bf7a30c91.1320088857.git.marvin24@gmx.de>
	<74CDBE0F657A3D45AFBB94109FB122FF173EDAB86E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173EDAB86E@HQMAIL01.nvidia.com>
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

On Monday 31 October 2011 13:14:17 Stephen Warren wrote:
> Marc Dietrich wrote at Monday, October 31, 2011 1:59 PM:
> > This adds a dts file for paz00. As a side effect, this also enables
> > the embedded controller which controls the keyboard, touchpad, power,
> > leds, and some other functions.
> 
> ...
> 
> > +	serial@70006000 {
> > +		clock-frequency = <216000000>;
> > +	};
> > +
> > +	serial@70006040 {
> > +		status = "disable";
> > +	};
> > +
> > +	serial@70006200 {
> > +		status = "disable";
> > +	};
> > +
> > +	serial@70006300 {
> > +		clock-frequency = <216000000>;
> > +	};
> 
> Don't you also want to disable serial@70006400, or set a clock rate for
> it?

I just didn't noticed its existance because I configured a maximum of four 
serial ports only, so it didn't showed up in the boot log.
