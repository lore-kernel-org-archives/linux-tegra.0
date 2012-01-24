From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Tue, 24 Jan 2012 14:43:09 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81EEB@HQMAIL01.nvidia.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
 <1326932212-30346-1-git-send-email-swarren@nvidia.com>
 <20120124095241.GO10446@tbergstrom-lnx.Nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB81EC4@HQMAIL01.nvidia.com>
 <CAMbhsRQYt7RoXTDDPxCgGG2UX5_T86saOyns_0f_Sz-p7-gMTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAMbhsRQYt7RoXTDDPxCgGG2UX5_T86saOyns_0f_Sz-p7-gMTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Tuesday, January 24, 2012 3:33 PM:
> On Tue, Jan 24, 2012 at 2:08 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Peter De Schrijver wrote at Tuesday, January 24, 2012 2:53 AM:
> >> What about the peripheral resets which are also handled by CAR? Peripheral
> >> clock nodes also offer assert and deassert methods for the reset signal
> >> associated with them. Those methods are used when powergating domains for
> >> example. Should we model this in the same binding?
> >
> > In most cases, I think the resets are handled purely within clock enable
> > and disable, so there's no need to explicitly manage them or represent
> > them in the device tree. Do you agree here?
> 
> clk_enable could force a deasserted reset, but clk_disable cannot
> imply asserting reset.  The clocks need to be turned off for power
> management without resetting the registers.

Yes, I just spoke to someone off-list, and he said the same thing. He
went on to say that therefore even the reset removal with clk_enable
was questionable, and that drivers should explicitly manage reset
removal themselves. Does that seem a reasonable stance? It'd certainly
take away the somewhat asymmetric nature of reset removal just magically
working when you first enable the clocks. We'd presumably then want a
common reset infra-structure and binding to match that change?

(I know that'd make Simon happy, since then we'd be able to represent
the reset IDs directly everywhere, unrelated to the clock IDs, and
hence he could just use the reset IDs directly in the U-Boot code he's
writing and ignore the non 1:1 mapping between clock and reset IDs)

> > I recall that you mentioned some power-management code might need to
> > manage reset separately though. Can you explain why a module would be
> > reset separately from disabling the clocks though?
> 
> The TRM lists a very specific sequence of clocks, resets, clamps, and
> power for power domain gating.  Other than that, I think the only use
> for directly calling reset that ended up in the Android Tegra2 tree
> was for error recovery on HW blocks that could get locked up, probably
> I2C.

OK, those reasons make sense.

-- 
nvpublic
