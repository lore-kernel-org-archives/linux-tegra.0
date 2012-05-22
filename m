From: Simon Glass <sjg@chromium.org>
Subject: Re: Unifying device tree filenames, and U-Boot SoC name
Date: Mon, 21 May 2012 17:49:03 -0700
Message-ID: <CAPnjgZ3rcprV5Es3Omcnwr8EdvP+1E94U__Ou_9wzw1048beNQ@mail.gmail.com>
References: <4FB3E788.2040801@wwwdotorg.org>
	<20120521142214.GC21513@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0392206972=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20120521142214.GC21513@avionic-0098.mockup.avionic-design.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Tom Warren <TWarren@nvidia.com>, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

--===============0392206972==
Content-Type: multipart/alternative; boundary=e89a8f6471b198f83104c095626b

--e89a8f6471b198f83104c095626b
Content-Type: text/plain; charset=ISO-8859-1

Hi Stephen,

On Mon, May 21, 2012 at 7:22 AM, Thierry Reding <
thierry.reding@avionic-design.de> wrote:

> * Stephen Warren wrote:
> > I just posted a patch which causes U-Boot to define some variables
> > describing which board you're running on:
> >
> > http://lists.denx.de/pipermail/u-boot/2012-May/124556.html
> >
> > In particular, see the description of that first patch for motivation
> > re: U-Boot scripts.
> >
> > The one issue here is that the U-Boot SoC name for Tegra20 is tegra2
> > (hence it will define board_soc=tegra2), whereas the kernel's device
> > tree files are all tegra-*.dts not tegra2-*.dts.
> >
> > I propose we fix this by:
> >
> > a) In the kernel, renaming tegra*-${board}.dts to tegra20-${board}.dts
> > (or tegra30-${board}.dts). This appears to better match what most other
> > ARM sub-arches are doing anyway.
> >
> > b) In U-Boot, rename the tegra2 support to tegra20 so that U-Boot ends
> > up setting board_soc=tegra20, so this matches the .dts/.dtb filenames.
> > This would involve renaming arch/arm/cpu/armv7/tegra2/ to
> > ./arch/arm/cpu/armv7/tegra20/ and editing boards.cfg to match, and
> > possibly other related changes.
> >
> > This sounds like churn, but I think we could easily fold this into
> > Allen's series that moves the tegra2 directory in order to put it in a
> > common place for separate SPL/non-SPL builds to avoid doing this kind of
> > thing multiple times.
> >
> > Does anyone think this is a good/bad/... idea? Thanks.
>
> I like it. It's better to have the names consistent.
>

Sounds good to me, too.


>
> Thierry
>

Regards,
Simon

--e89a8f6471b198f83104c095626b--

--===============0392206972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0392206972==--
