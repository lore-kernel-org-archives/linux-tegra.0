From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Mon, 23 Jan 2012 08:29:12 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81A9E@HQMAIL01.nvidia.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
 <1326932212-30346-1-git-send-email-swarren@nvidia.com>
 <CAPnjgZ2t9FnEubWmLyNMGGhr=jEmfb1qzK=SAzRopjbCbHKdrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ2t9FnEubWmLyNMGGhr=jEmfb1qzK=SAzRopjbCbHKdrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Simon Glass wrote at Sunday, January 22, 2012 11:03 AM:
> On Wed, Jan 18, 2012 at 4:16 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Document a binding for the Tegra20 CAR (Clock And Reset) Controller,
> > add it to tegra20.dtsi, and configure it for the board in tegra-
> > seaboard.dts.
...
> > A comment on the shared enable issue:
> >
> > When enabling/disabling clocks, Tegra requires you to reset the HW module
> > that the clock is routed to. Both reset and clock enable registers are
> > part of the CAR. U-Boot currently has an API to do the reset based on a
> > "peripheral ID", which simply means a bit number in a set of 3 "reset"
> > registers. The bits in those registers share the same numbering as the
> > "clock enable" registers. Hence, to make life easy for U-Boot, I've
> > defined the clock IDs in this binding to be equal to these bit numbers.
> > However, this breaks down where there isn't a 1:1 mapping between reset
> > and clock enable bits, and clocks. For example, there's a single reset
> > and clock enable bit for the SPDIF controller, yet this applies to two
> > clocks; spdif_in and spdif_out. Hence, this simplification for U-Boot
> > breaks down. I think the correct solution is to fix U-Boot not to
> > require this simplification, renumber the clocks in the CAR binding in
> > a completely arbitrary fashion, and require U-Boot to contain a mapping
> > table between CAR's DT clock IDs and any other information related to
> > those clocks. Do you see any alternative? We really need the two SPDIF
> > clocks to be different clock IDs in the binding, since each has a
> > completely independant mux for the clock source/parent, and the two
> > clocks obviously can't share the same clock ID (well, hmm, perhaps they
> > could if we used 2 cells for the specifier, 1 for the bit number, and
> > one more to differentiate clocks that use the same bit...). I'm still
> > inclined to simply push back on U-Boot to do it right.
> 
> Are SPDIF and VI the only examples of this?

I think so. I should double-check to be sure though before committing
to a final binding.

> If so, perhaps just having
> a special extra clock ID for those two and mapping in a special way
> would be more efficient. So two IDs would map to one clock/reset bit
> but different clocks.

I thought about that initially, but it doesn't make semantic sense;
there isn't a 1:1 mapping between clock ID and reset bit, so I don't
think we should pretend there is for some clocks, and special-case
others.

> Also I note that one is an input and one is an output clock. So we
> could name them this way, and use the separate ID for the input clocks
> perhaps.

I don't think that solves the problem; HW modules and drivers use both
clocks, so special-casing the input clocks doesn't make the problem
less relevant.

> If you do add an arbitrary mapping, what would it be? It might as well
> follow along with the registers so far as it can, since the device
> tree should describe the hardware. Then the mapping becomes a few
> lines of code in the driver instead of YAT (yet another table).

The mapping would be that the clock IDs are unrelated to the bit numbers
in the CAR's reset/clock-enable registers.

In practice, this means that to find the reset bit number, you need a
table indexed by the .dts's clock number, with the bit number being
retrieved from that table.

So instead of bit = of_get_u32(1), we'd have bit = table[of_get_u32(1)].

In practice, I believe we'll need such a table anyway, since each clock
has many more parameters than just the reset bit ID; some clocks have
no reset bit at all, some clocks have a mux but some don't, the inputs
to the mux are different for each clock, some have a divider but some
don't, where there's a divider or mux, you need to know the register
address to configure them, each clock has a different max rate, etc.

Having thought a little more about this, I'm definitely leaning towards
this way; making the clock ID and register bit completely unrelated just
to make it really obvious that you can't use the clock ID as a register
bit.

-- 
nvpublic
