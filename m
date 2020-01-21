From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Date: Tue, 21 Jan 2020 16:54:32 +0100
Message-ID: <20200121155432.GA912205@ulmo>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <83d94918-bc01-131b-924c-9750767d3b29-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
> On 1/21/20 16:10, Thierry Reding wrote:
> > On Tue, Jan 21, 2020 at 09:53:48AM +0300, Dmitry Osipenko wrote:
> >> 20.01.2020 18:06, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Fri, Jan 17, 2020 at 05:23:43PM +0200, Georgi Djakov wrote:
> >>>> Hi Thierry,
> >>>>
> >>>> Thanks for the patch!
> >>>>
> >>>> On 1/14/20 20:15, Thierry Reding wrote:
> >>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>>
> >>>>> Document the interconnects property that is used to describe the pa=
ths
> >>>>> from and to system memory from and to the BPMP.
> >>>>>
> >>>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>> ---
> >>>>> Rob, Georgi,
> >>>>>
> >>>>> after the initial RFC that I did for adding interconnect properties=
 on
> >>>>> Tegra, I realized that the description wasn't complete. This is an
> >>>>> attempt at a more accurate description, but unfortunately I'm not s=
ure
> >>>>> if it's even correct in terms of the interconnect bindings.
> >>>>>
> >>>>> The problem here is that on Tegra, each device has multiple paths to
> >>>>> system memory, and I have no good idea on what to pick as the defau=
lt.
> >>>>> They are all basically the same path, but each provides extra contr=
ols
> >>>>> to configure the "interconnect".
> >>>>
> >>>> Are these multiple paths between a device and system memory used sim=
ultaneously
> >>>> for load-balancing, or who makes the decision about which path would=
 be used?
> >>>
> >>> It varies. The vast majority of these paths are read/write pairs, whi=
ch
> >>> can be configured separately. There are also cases where multiple pat=
hs
> >>> are used for load-balancing and I don't think there's any direct
> >>> software control over which path will be used.
> >>>
> >>> A third class is where you have one device, but two read/write pairs,
> >>> one which is tied to a microcontroller that's part of the device, and
> >>> another read/write pair that is used for DMA to/from the device.
> >>>
> >>> Often in the latter case, the microcontroller memory client interfaces
> >>> will be used by the microcontroller to read firmware and once the mic=
ro-
> >>> controller has booted up, the DMA memory client interfaces will be us=
ed
> >>> to read/write system memory with bulk data (like frame buffers, etc.).
> >>>
> >>>> Is this based on the client/stream ID that you mentioned previously?
> >>>
> >>> These are now all what's call memory client IDs, which identify the
> >>> corresponding interface to the memory controller. Stream IDs are
> >>> slightly higher-level and typically identify the "module" that uses
> >>> the SMMU. Generally a stream ID is mapped to one or more memory client
> >>> IDs.
> >>>
> >>>> Looking at the the binding below, it seems to me like there are diff=
erent
> >>>> master/slave pairs between MC and EMC and each link is used for
> >>>> unidirectional traffic only. In terms of the interconnect API, both =
read
> >>>> and write paths have the same direction.
> >>
> >> Yes, that definition should be incorrect.
> >>
> >>> I'm not sure I understand what you mean by this last sentence. Are you
> >>> saying that each path in terms of the interconnect API is a always a
> >>> bidirectional link?
> >>
> >> Please see more below.
> >>
> >>>> Is the EMC really an interconnect provider or is it just a slave por=
t? Can
> >>>> we scale both EMC and MC independently?
> >>>
> >>> The EMC is the only one where we can scale the frequency, but the MC =
has
> >>> various knobs that can be used to fine-tune arbitration, set maximum
> >>> latency, etc.
> >>
> >> Yes..
> >>
> >>
> >> EMC controls the total amount of available memory bandwidth, things li=
ke
> >> DRAM timing and EMC-DRAM channel's performance. EMC is facing MC from
> >> one side and DRAM (EMEM) from the other.
> >>
>=20
> Right, so we can use the icc framework here to aggregate the requested ba=
ndwidth
> from all clients and scale the frequency/voltage of EMC.

Yeah, that was the plan. Dmitry's patches implement most of that. Note
that we're working on this from two sides: on one hand we need to figure
out the bindings so that we can set up the interconnect paths, then the
memory controller and external memory controller drivers need to be made
interconnect providers so that we can actually implement the dynamic
scaling (and then finally all memory client drivers need to be updated
to actually use these ICC framework to request bandwidth).

I'm prioritizing the first issue right now because that's currently a
blocker for enabling SMMU support on Tegra194 where we need to set the
DMA mask based on the "bus" (i.e. DMA parent, i.e. the MC) because there
are additional restrictions that don't exist on prior generations where
we can simply set the DMA mask to the device's "native" DMA mask.

EMC frequency scaling is slightly lower on my priority list because in
most use-cases there is enough bandwidth at the default EMC frequency.

> >> MC controls allocation of that total bandwidth between the memory
> >> clients. It has knobs to prioritize clients, the knobs are per
> >> read/write port. MC is facing memory clients from one side and EMC from
> >> the other.
> >>
>=20
> Thanks for clarifying! So are these QoS knobs (priority, latency etc.) tu=
ned
> dynamically during runtime or is it more like a static configuration that=
 is
> done for example just once during system boot?

The hardware defaults are usually sufficient unless the system is under
very high memory pressure. I'm only aware of one case where we actually
need to override the hardware default on boot and it's exotic enough to
not be upstream yet.

Ultimately we want to tune these at runtime, typically together with and
depending on the EMC frequency. Under memory pressure you can use the
"latency allowance" registers to prioritize memory requests from
isochronous clients (like display controllers) to ensure they don't
underrun.

Given that we only have to tune these under somewhat extreme conditions,
I think these are lower priority from an implementation point of view
than the EMC frequency scaling, but the registers are based on the
memory client IDs, so I think it's convenient to have those be part of
the bindings in the first place.

> >>> I vaguely recall Dmitry mentioning that the EMC in early generations =
of
> >>> Tegra used to have controls for individual memory clients, but I don't
> >>> see that in more recent generations.
> >>
> >> EMC doesn't have direct controls over memory clients on all Tegra SoCs,
> >> but it may have some extra knobs for the MC arbitration config.
> >>
> >> The MC bandwidth allocation logic and hardware programming interface
> >> differs among SoC generations, but the basic principle is the same.
> >>
> >>>>> Any ideas on how to resolve this? Let me know if the DT bindings and
> >>>>> example don't make things clear enough.
> >>
> >> I'm also interested in the answer to this question.
> >>
> >> A quick thought.. maybe it could be some new ICC DT property which tel=
ls
> >> that all paths are the "dma-mem":
> >>
> >> 	interconnects-all-dma-mem;
> >=20
> > There could easily be cases where multiple interconnects are to system
> > memory but there are additional ones which aren't, so the above wouldn't
> > be able to represent such cases.
>=20
> Yes, true.
>=20
> >>>>>  .../firmware/nvidia,tegra186-bpmp.yaml        | 59 +++++++++++++++=
++++
> >>>>>  1 file changed, 59 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegr=
a186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186=
-bpmp.yaml
> >>>>> index dabf1c1aec2f..d40fcd836e90 100644
> >>>>> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bp=
mp.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bp=
mp.yaml
> >>>>> @@ -43,6 +43,24 @@ properties:
> >>>>>        - enum:
> >>>>>            - nvidia,tegra186-bpmp
> >>>>> =20
> >>>>> +  interconnects:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>> +    description: A list of phandle and specifier pairs that descri=
be the
> >>>>> +      interconnect paths to and from the BPMP.
> >>>>> +
> >>>>> +  interconnect-names:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> >>>>> +    description: One string for each pair of phandle and specifier=
 in the
> >>>>> +      "interconnects" property.
> >>>>> +    # XXX We need at least one of these to be named dma-mem so tha=
t the core
> >>>>> +    # will set the DMA mask based on the DMA parent, but all of th=
ese go to
> >>>>> +    # system memory eventually.
> >>>>> +    items:
> >>>>> +      - const: dma-mem
> >>>>> +      - const: dma-mem
> >>>>> +      - const: dma-mem
> >>>>> +      - const: dma-mem
> >>
> >> Names should be unique, otherwise it's not possible to retrieve ICC pa=
th
> >> other than the first one.
> >=20
> > Yeah, I know, that's why there's an XXX comment. =3D) I just wasn't sure
> > what else to put there and thought this kinda made it clear that it was
> > only half-baked.
> >=20
> >>>>>    iommus:
> >>>>>      $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>>      description: |
> >>>>> @@ -152,8 +170,43 @@ additionalProperties: false
> >>>>> =20
> >>>>>  examples:
> >>>>>    - |
> >>>>> +    #include <dt-bindings/clock/tegra186-clock.h>
> >>>>>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>>      #include <dt-bindings/mailbox/tegra186-hsp.h>
> >>>>> +    #include <dt-bindings/memory/tegra186-mc.h>
> >>>>> +
> >>>>> +    mc: memory-controller@2c00000 {
> >>>>> +        compatible =3D "nvidia,tegra186-mc";
> >>>>> +        reg =3D <0x02c00000 0xb0000>;
> >>>>> +        interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> >>>>> +        status =3D "disabled";
> >>>>> +
> >>>>> +        #interconnect-cells =3D <1>;
> >>>>> +        #address-cells =3D <2>;
> >>>>> +        #size-cells =3D <2>;
> >>>>> +
> >>>>> +        ranges =3D <0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
> >>>>> +
> >>>>> +        /*
> >>>>> +         * Memory clients have access to all 40 bits that the memo=
ry
> >>>>> +         * controller can address.
> >>>>> +         */
> >>>>> +        dma-ranges =3D <0x0 0x0 0x0 0x100 0x0>;
> >>>>> +
> >>>>> +        #memory-controller-cells =3D <0>;
> >>>>> +
> >>>>> +        emc: external-memory-controller@2c60000 {
> >>>>> +            compatible =3D "nvidia,tegra186-emc";
> >>>>> +            reg =3D <0x0 0x02c60000 0x0 0x50000>;
> >>>>> +            interrupts =3D <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> >>>>> +            clocks =3D <&bpmp TEGRA186_CLK_EMC>;
> >>>>> +            clock-names =3D "emc";
> >>>>> +
> >>>>> +            #interconnect-cells =3D <0>;
> >>>>> +
> >>>>> +            nvidia,bpmp =3D <&bpmp>;
> >>>>> +        };
> >>>>> +    };
> >>>>> =20
> >>>>>      hsp_top0: hsp@3c00000 {
> >>>>>          compatible =3D "nvidia,tegra186-hsp";
> >>>>> @@ -187,6 +240,12 @@ examples:
> >>>>> =20
> >>>>>      bpmp {
> >>>>>          compatible =3D "nvidia,tegra186-bpmp";
> >>>>> +        interconnects =3D <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPR>,
> >>>>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
> >>>>> +                        <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
> >>>>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
> >>
> >> I don't think this is a correct definition of the ICC paths because the
> >> first node-MC_ID pair should define the source, second pair is the fin=
al
> >> destination. Then the interconnect core builds (by itself) the path fr=
om
> >> MC client to MC and finally to EMC based on the given source /
> >> destination. Please see my v1 patchset for the example.
> >=20
> > Okay, sounds like "source" in this case means the initiator of the
> > transaction and destination is the target of the transaction. I had
> > interpreted the "source" as the "source location" of the transaction (so
> > for reads the source would be the system memory via the EMC, and for
> > writes the source would be the memory client interface).
>=20
> Yes, exactly. Maybe it would be more correct to call these pairs
> initiator/target or master/slave.

Do you want me to extend the bindings documentation to mention these
alternative names?

> > Yeah, I think that makes sense. It was also pointed out to me (offline)
> > that the above doesn't work as intented for the use-case where I really
> > need it. The primary reason why I need these "dma-mem" interconnect
> > paths is so that the memory controller is specified as the "DMA parent"
> > for these devices, which is important so that the DMA masks can be
> > correctly set. Having the &emc reference in the first slot breaks that.
> > Your suggestion makes sense when interpreting the terminology
> > differently and it fixes the DMA parent issue (at least partially).
> >=20
> >> It should look somewhat like this:
> >>
> >> interconnects =3D
> >>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc TEGRA_ICC_EMEM>,
> >>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc TEGRA_ICC_EMEM>,
> >>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc TEGRA_ICC_EMEM>,
> >>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc TEGRA_ICC_EMEM>;
> >>
> >> interconnect-names =3D "bpmpr", "bpmpw", "bpmpdmar", "bpmpdmaw";
>=20
> This looks better to me.
>=20
> > I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
> > going to be the same and it's arbitrarily defined, so it's effectively
> > useless. But other than that it looks good.
>=20
> Well, in most cases the target would be the EMEM, so that's fine. I have =
seen
> that other vendors that may have an additional internal memory, especially
> dedicated to some DSPs and in such cases the bandwidth needs are differen=
t for
> the two paths (to internal memory and DDR).

Most chips have a small internal memory that can be used, though it
seldomly is. However, in that case I would expect the target to be a
completely different device, so it'd look more like this:

	interconnects =3D <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
			...;

I don't think EMEM has any "downstream" other than external memory.

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4nHrYACgkQ3SOs138+
s6G3Cg//YhZvKviEumpYmgRJnFnYLL2p3sDnFr803uJ7BvQ3rH492UgfBnm3ozrR
+wfgvNLiR8phZyqTBz8KOFCi64MClwTxSvJC77Pa4RQ0q66T1LPeuKhSF5jZG4gK
SM6l4LzkZgwTpGsYi2emcRo3k8XUxjnut1tk8F6dd+5AmDDscu51S1E8Bx7Px0CN
gwzTvlWNnr5BgkIhdonpPaluV0FAMQat4BFW1u+89NKkNZ29s/pw6qwvci5oZwOw
HRtabHi5e078JrWj2cAaqAxuMq5Hy6b06HY+OMvTImnJSNEd6L2eUlyyqiZoZxZx
o3aCgN+aFf9N20Nrr8Kf71/NyHp+hwnsPyzbE7+E3XYk6fVjlNM3rPiR45RHsfDx
6OSUndbNlXfBdrPNFwkrt3VBOTipUzZdY/EQ2gXL4ZL9tKecMc5pqcjWR+MztRNd
NScQB/CycACbDNkJavL45Nqxk/4SqVZ93snB0j2UcCzfyOTSusJVSz077sEWBmEu
9Ka9am1GVJFb4zMvtrXCuwwOxqQjkXzqYMxtGdQrUohMoRZtcYI0JI2gsbzN2VYr
WoiJn8vJOgWy339SFfd4dbN8g0uyoA48yyXjmGl7FIAnJ97jdmzDDY1IgBLbJJ80
MMYbp9ywTYsWL6+bB4mD1R6Ydo7TtMEL8HD2MM6ZVrUEYRWECnI=
=YV2D
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
