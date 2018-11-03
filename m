From: Anthony Eden <aeden@csail.mit.edu>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v4.19-rc1
Date: Sat, 3 Nov 2018 16:08:51 -0400
Message-ID: <CAHMsQjXXM0Vfx1MQ4C++--55vdAMYx-9CG00QM7893K17Ca5jw@mail.gmail.com>
References: <20180712154128.22705-1-thierry.reding@gmail.com>
 <20180712154128.22705-6-thierry.reding@gmail.com>
 <20180714212210.at4b2gcpopsznyxx@localhost>
 <20180803104318.GA28546@ulmo>
 <CAHMsQjU=nmpTnPK6Ryhui67YVANHExd=yRB4hp+upd7O-Tjn+Q@mail.gmail.com>
 <20180809102104.GB21639@ulmo> <51a19ec3-8b34-56f5-d9c7-69397d3d11ff@kapsi.fi>
 <20180809140753.GH21639@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000001881bb0579c839ef"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180809140753.GH21639@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, arm@kernel.org, Olof Johansson <olof@lixom.net>, Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

--0000000000001881bb0579c839ef
Content-Type: text/plain; charset="UTF-8"

Sorry for the late reply. Thank you for the helpful information and guidance.

But before I investigate the thermal hypothesis further, I thought I'd
send out a kernel panic that I captured today during one of these
hangs. At the time I was upgrading packages via pacman (ArchLinux).
Does this shed any light on the issue?

Best,
-Anthony

On Thu, Aug 9, 2018 at 10:07 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Aug 09, 2018 at 01:34:37PM +0300, Mikko Perttunen wrote:
> > On 09.08.2018 13:21, Thierry Reding wrote:
> > > On Fri, Aug 03, 2018 at 07:26:04AM -0400, Anthony Eden wrote:
> > > > Mesa support aside- if I start a computationally intensive job on the
> > > > Jetson TX2 like building the Linux kernel on all cores, it will lock
> > > > up. My only work around has been to disable the Denver CPU's. I don't
> > > > think the tegra186 has upstream support to control the fan on the
> > > > Jetson TX2, could this be a thermal problem?
> > >
> > > Yes, I suppose this could be a thermal problem. Or it could be something
> > > else entirely. We do support CPU frequency scaling on Tegra X2, so what
> > > you could do is keep the Denver CPUs enabled, but set the powersave CPU
> > > frequency governor. That way it should use all the CPUs but at a lower
> > > clock rate, which should also be able to avoid any thermal issues. This
> > > could help determine whether or not the problem is thermal or something
> > > else.
> > >
> > > Also adding Mikko on Cc who wrote the Tegra186 driver, maybe he's aware
> > > of any issues.
> >
> > I haven't seen any issues myself, though I haven't stressed the CPU too
> > heavily. We also have a thermal driver for Tegra186, so we could set up
> > thermal throttling with a device tree change.
>
> Do you have an example of how that would work? The DT bindings are a
> little sparse on the specifics. It seems like something similar to what
> we did on Tegra124 could be done on Tegra186.
>
> Anthony: do you think you could come up with something suitable based on
> what arch/arm/boot/dts/tegra124{.dtsi,-jetson-tk1.dts} and the device
> tree bindings for Tegra186 contain in
>
>         Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
>
> as well as
>
>         include/dt-bindings/thermal/tegra186-bpmp-thermal.h
>
> ? That's provided that reducing the CPU frequency does indeed prevent
> the lock up that you were seeing.
>
> Thierry

--0000000000001881bb0579c839ef
Content-Type: text/plain; charset="US-ASCII"; name="hardy.crash.2018.11.03.txt"
Content-Disposition: attachment; filename="hardy.crash.2018.11.03.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jo1v6q970>
X-Attachment-Id: f_jo1v6q970

L3Vzci9saWIvc3lzdGVtZC9zeXN0ZW1kOiBlcnJvciB3aFsgICAgNy40MTE5MzFdIEtlcm5lbCBw
YW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISBleGl0Y29kZT0weDAw
MDA3ZjAwClsgICAgNy40MTE5MzFdClsgICAgNy40MjM4MTddIENQVTogMCBQSUQ6IDEgQ29tbTog
c3lzdGVtZCBUYWludGVkOiBHIFMgICAgICAgICAgICAgICAgNC4xOS4wLTIyLUFSQ0ggIzEKWyAg
ICA3LjQzMTY2MV0gSGFyZHdhcmUgbmFtZTogTlZJRElBIFRlZ3JhMTg2IFAyNzcxLTAwMDAgRGV2
ZWxvcG1lbnQgQm9hcmQgKERUKQpbICAgIDcuNDM4NzIxXSBDYWxsIHRyYWNlOgpbICAgIDcuNDQx
MTc2XSAgZHVtcF9iYWNrdHJhY2UrMHgwLzB4MTgwClsgICAgNy40NDQ4NDVdICBzaG93X3N0YWNr
KzB4MjQvMHgzMApbICAgIDcuNDQ4MTY4XSAgZHVtcF9zdGFjaysweDljLzB4YmMKWyAgICA3LjQ1
MTQ5MF0gIHBhbmljKzB4MTI0LzB4Mjc0ClsgICAgNy40NTQ1NTFdICBkb19leGl0KzB4YTgwLzB4
YWIwClsgICAgNy40NTc3ODRdICBkb19ncm91cF9leGl0KzB4M2MvMHhkMApbICAgIDcuNDYxMzY1
XSAgX19hcm02NF9zeXNfZXhpdF9ncm91cCsweDI0LzB4MjgKWyAgICA3LjQ2NTcyOV0gIGVsMF9z
dmNfY29tbW9uKzB4OTQvMHhlOApbICAgIDcuNDY5Mzk3XSAgZWwwX3N2Y19oYW5kbGVyKzB4Mzgv
MHg4MApbICAgIDcuNDczMTUyXSAgZWwwX3N2YysweDgvMHhjClsgICAgNy40NzYwMzldIFNNUDog
c3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMKWyAgICA3LjQ3OTk3NF0gS2VybmVsIE9mZnNldDogZGlz
YWJsZWQKWyAgICA3LjQ4MzQ2OV0gQ1BVIGZlYXR1cmVzOiAweDAsMjAwMDIwMDAKWyAgICA3LjQ4
NzIyMl0gTWVtb3J5IExpbWl0OiBub25lClsgICAgNy40OTAyODVdIC0tLVsgZW5kIEtlcm5lbCBw
YW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISBleGl0Y29kZT0weDAw
MDA3ZjAwClsgICAgNy40OTAyODVdICBdLS0tCmlsZSBsb2FkaW5nIHNoYXJlZCBsaWJyYXJpZXM6
IC91WyAgICA3LjUwMDczMF0gV0FSTklORzogQ1BVOiAwIFBJRDogMSBhdCBrZXJuZWwvc2NoZWQv
Y29yZS5jOjExNjMgc2V0X3Rhc2tfY3B1KzB4MWI4LzB4MWM4ClsgICAgNy41MTE0NDhdIE1vZHVs
ZXMgbGlua2VkIGluOiBudm1lIG52bWVfY29yZSBicm9hZGNvbSBtYXg3NzYyMF93ZHQgYmNtX3Bo
eV9saWIgbWF4Nzc2MjBfdGhlcm1hbCBpbmEzMjIxIHRlZ3JhX2RybSBkcm1fa21zX2hlbHBlciBk
cm0gZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcyBzeXNjb3B5YXJlYSBncGlvX2tleXMgc3lz
ZmlsbHJlY3Qgc3lzaW1nYmx0IHRlZ3JhX2JwbXBfdGhlcm1hbCBkd21hY19kd2NfcW9zX2V0aCBp
MmNfdGVncmFfYnBtcCBmYl9zeXNfZm9wcyBzdG1tYWNfcGxhdGZvcm0gc3RtbWFjIGkyY190ZWdy
YSBob3N0MXgKWyAgICA3LjUzODkwMl0gQ1BVOiAwIFBJRDogMSBDb21tOiBzeXN0ZW1kIFRhaW50
ZWQ6IEcgUyAgICAgICAgICAgICAgICA0LjE5LjAtMjItQVJDSCAjMQpbICAgIDcuNTQ2NzQ4XSBI
YXJkd2FyZSBuYW1lOiBOVklESUEgVGVncmExODYgUDI3NzEtMDAwMCBEZXZlbG9wbWVudCBCb2Fy
ZCAoRFQpClsgICAgNy41NTM4MDldIHBzdGF0ZTogMjAwMDAwODUgKG56Q3YgZGFJZiAtUEFOIC1V
QU8pClsgICAgNy41NTg2MDldIHBjIDogc2V0X3Rhc2tfY3B1KzB4MWI4LzB4MWM4ClsgICAgNy41
NjI2MjddIGxyIDogdHJ5X3RvX3dha2VfdXArMHgxOTAvMHg0NzgKWyAgICA3LjU2NjgxNV0gc3Ag
OiBmZmZmMDAwMDA4MDAzZDEwClsgICAgNy41NzAxMzRdIHgyOTogZmZmZjAwMDAwODAwM2QxMCB4
Mjg6IGZmZmYwMDAwMDk2MTYwYzAKWyAgICA3LjU3NTQ1Nl0geDI3OiBmZmZmMDAwMDA5NWZjMDAw
IHgyNjogMDAwMDAwMDAwMDAwMDEwMApbICAgIDcuNTgwNzc5XSB4MjU6IDAwMDAwMDAwMDAwMDAw
MDUgeDI0OiBmZmZmMDAwMDA5NjFhNDkwClsgICAgNy41ODYxMDJdIHgyMzogZmZmZjAwMDAwOTYw
ODljMCB4MjI6IDAwMDAwMDAwMDAwMDAwMDAKWyAgICA3LjU5MzI2OF0geDIxOiAwMDAwMDAwMDAw
MDAwMDA0IHgyMDogMDAwMDAwMDAwMDAwMDAwNQpbICAgIDcuNjAwNDI2XSB4MTk6IGZmZmY4MDAx
ZWQxZjVlODAgeDE4OiAwMDAwMDAwMDAwMDAwMDAwClsgICAgNy42MDc1ODRdIHgxNzogMDAwMDAw
MDAwMDAwMDAwMCB4MTY6IDAwMDAwMDAwMDAwMDAwMDAKWyAgICA3LjYxNDc0MF0geDE1OiAwMDAw
MDAwMDAwMDAwMDAwIHgxNDogMDAwMDAwMDAwMDAwMDAwMApbICAgIDcuNjIxODY2XSB4MTM6IGZm
ZmYwMDAwMDhjYTI2NTggeDEyOiAwMDAwMDAwMGZmZmZmZmZmClsgICAgNy42MjkwMDZdIHgxMTog
MDAwMDAwMDAwMDAwMDA5YyB4MTA6IDAwMDAwMDAwMDAwMDAwMDEKWyAgICA3LjYzNjEzNV0geDkg
OiAwMDAwMDAwMDAwMDAwMDAwIHg4IDogZmZmZjgwMDFmNjc0MTJhOApbICAgIDcuNjQzMjQxXSB4
NyA6IDAwNDAwMDAwMDAwMDAwMDAgeDYgOiAwMDAwMDAwMDAwMDAwMDM2ClsgICAgNy42NTAzNThd
IHg1IDogMDAwMDgwMDFlZDE0MDAwMCB4NCA6IGZmZmYwMDAwMDk2MWE0OTAKWyAgICA3LjY1NzQ1
N10geDMgOiAwMDAwODAwMWVkMWI4MDAwIHgyIDogMDAwMDAwMDAwMDAwMDAwNQpbICAgIDcuNjY0
NTYzXSB4MSA6IGZmZmYwMDAwMDk2MTk3MDAgeDAgOiAwMDAwMDAwMDAwMDAwMDAwClsgICAgNy42
NzE2NDFdIENhbGwgdHJhY2U6ClsgICAgNy42NzU3NTNdICBzZXRfdGFza19jcHUrMHgxYjgvMHgx
YzgKWyAgICA3LjY4MTA4MV0gIHRyeV90b193YWtlX3VwKzB4MTkwLzB4NDc4ClsgICAgNy42ODY1
OTNdICB3YWtlX3VwX3Byb2Nlc3MrMHgyOC8weDM4ClsgICAgNy42OTE5OTNdICBwcm9jZXNzX3Rp
bWVvdXQrMHgyMC8weDMwClsgICAgNy42OTczNTVdICBjYWxsX3RpbWVyX2ZuKzB4MzQvMHgxNzAK
WyAgICA3LjcwMjYzNl0gIGV4cGlyZV90aW1lcnMrMHhjMC8weDE0OApbICAgIDcuNzA3OTA4XSAg
cnVuX3RpbWVyX3NvZnRpcnErMHhiYy8weDFkOApbICAgIDcuNzEzNTE1XSAgX19kb19zb2Z0aXJx
KzB4MTIwLzB4MzAwClsgICAgNy43MTg3ODFdICBpcnFfZXhpdCsweGMwLzB4ZDAKWyAgICA3Ljcy
MzUwNV0gIF9faGFuZGxlX2RvbWFpbl9pcnErMHg3MC8weGMwClsgICAgNy43MjkxMzhdICBnaWNf
aGFuZGxlX2lycSsweDU4LzB4YTgKWyAgICA3LjczNDMzMl0gIGVsMV9pcnErMHhiMC8weDE0MApb
ICAgIDcuNzM5MDA2XSAgcGFuaWMrMHgyMjQvMHgyNzQKWyAgICA3Ljc0MzU2MV0gIGRvX2V4aXQr
MHhhODAvMHhhYjAKWyAgICA3Ljc0ODI5OV0gIGRvX2dyb3VwX2V4aXQrMHgzYy8weGQwClsgICAg
Ny43NTMzNjFdICBfX2FybTY0X3N5c19leGl0X2dyb3VwKzB4MjQvMHgyOApbICAgIDcuNzU5MjE3
XSAgZWwwX3N2Y19jb21tb24rMHg5NC8weGU4ClsgICAgNy43NjQzNTddICBlbDBfc3ZjX2hhbmRs
ZXIrMHgzOC8weDgwClsgICAgNy43Njk1NjJdICBlbDBfc3ZjKzB4OC8weGMKWyAgICA3Ljc3Mzkx
NV0gLS0tWyBlbmQgdHJhY2UgMjJlMmE4NDY1OGQwMDRkYSBdLS0tCnNyL2xpYi9saWJjcnlwdHNl
dHVwLnNvLjEyOiBmaWxlIHRvbyBzaG9ydAoK
--0000000000001881bb0579c839ef
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--0000000000001881bb0579c839ef--
