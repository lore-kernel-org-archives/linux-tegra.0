From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 10/20] tegra: fdt: Add additional USB binding
Date: Thu, 19 Jan 2012 15:55:48 -0800
Message-ID: <CAPnjgZ1J-GyvtbH8tSBzcwgfQJj9v=9Y=ibJNWv6Ru1+qXzLJQ@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-11-git-send-email-sjg@chromium.org>
	<4F174C3E.2090403@nvidia.com>
	<20120119053523.GB27447@quad.lixom.net>
	<CAPnjgZ0JAyV8+0kLv=EcM-AhBxE-YSyG-Y7rYPS8PhOAOnq6dw@mail.gmail.com>
	<CAOesGMjCxryS+3yQZqCP3JYeHpCbUuNHM+rtDBoOQjF6rwLv5g@mail.gmail.com>
	<CAPnjgZ10mwQJ7RubrO_VFdHF+39cHOjLPmQNbYBeERjTWJMU4Q@mail.gmail.com>
	<CAOesGMhOe6enf9BFgpCbvEgtT3F-p5rEsxp8=PG57sxBaQvawQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF1780DAB0D4@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB0D4@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Jan 19, 2012 at 9:33 AM, Stephen Warren <swarren@nvidia.com> wrote:
> Olof Johansson wrote at Thursday, January 19, 2012 12:13 AM:
>> On Wed, Jan 18, 2012 at 10:59 PM, Simon Glass <sjg@chromium.org> wrote:
>> > Hi Olof,
>> >
>> > On Wed, Jan 18, 2012 at 10:41 PM, Olof Johansson <olof@lixom.net> wrot=
e:
>> >> Hi,
>> >>
>> >> On Wed, Jan 18, 2012 at 9:55 PM, Simon Glass <sjg@chromium.org> wrote:
>> >>
>> >>>> fsl-usb.txt uses "dr_mode" here, which might make sense to reuse gi=
ven some of
>> >>>> the shared IP in question for device mode:
>> >>>>
>> >>>> =A0- dr_mode : indicates the working mode for "fsl-usb2-dr" compati=
ble
>> >>>> =A0 controllers. =A0Can be "host", "peripheral", or "otg". =A0Defau=
lt to
>> >>>> =A0 "host" if not defined for backward compatibility.
>> >>>
>> >>> What does 'dr' mean?
>> >>
>> >> After some searching, it looks like it means "dual-role", which seems
>> >> appropriate terminology for the tegra SoC as well.
>> >
>> > Thanks for looking that up.
>> >
>> > Well maybe, but it could mean data reverse mode or distinctive
>> > ring...I like Stephen's nice device-tree-friendly naming and
>> > explanation :-) Are we stuck with this?
>>
>> I think there's value in staying common with similar bindings on other
>> platforms, yes. Sorry. :)
>
> Ack from me too. If there's an existing convention, I'd prefer to stick
> with it. Sorry, I should have looked this up before coming up with
> something new.

OK thanks for that. Will take a look.

Regards,
Simon

>
> --
> nvpublic
>
