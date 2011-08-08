From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] arm/tegra: Delete irq_to_gpio
Date: Mon, 8 Aug 2011 12:10:46 -0600
Message-ID: <CACxGe6tkynxAAGJ6P0eXZ4+VNycNrmZ1xP6ru-82Qb-Fqph5JQ@mail.gmail.com>
References: <1312582534-10871-1-git-send-email-swarren@nvidia.com>
	<1312582534-10871-2-git-send-email-swarren@nvidia.com>
	<20110806174519.GB31966@ponder.secretlab.ca>
	<74CDBE0F657A3D45AFBB94109FB122FF049F172168@HQMAIL01.nvidia.com>
	<CAOesGMi2CXyAoy56-SdaD5YFzXW6W4wP6mnH+bVvRR3i_Mhk2A@mail.gmail.com>
	<CACxGe6ubndfYNxgRfrLtCZ8cP0FddwTpG_FBZKXVZb0OHJVt6w@mail.gmail.com>
	<20110808180540.GC19367@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110808180540.GC19367@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Warren <swarren@nvidia.com>, Erik Gilling <konkers@android.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 8, 2011 at 12:05 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, Aug 08, 2011 at 11:50:47AM -0600, Grant Likely wrote:
>> On Aug 8, 2011 8:26 AM, "Stephen Warren" <swarren@nvidia.com> wrote:
>> >
>> > Grant Likely wrote at Saturday, August 06, 2011 11:45 AM:
>> > > On Fri, Aug 05, 2011 at 04:15:34PM -0600, Stephen Warren wrote:
>> > > > irq_to_gpio is deprecated and in the process of being removed. Mak=
e that
>> > > > happen now for ARM Tegra.
>> > > >
>> > > > Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> > >
>> > > Applied both. =A0Thanks.
>> >
>> > Didn't you want an Ack by a Tegra maintainer first?
>>
>> It looks like a pretty low risk change.=A0 I didn't see much risk in
>> picking it up and getting it off my plate.=A0 I can always pull things
>> back out of my tree if someone complains. =A0I'll add Olof's ack before
>> it gets into linux-next.
>>
>> >
>> > I assume they were both applied to gpio-next (although a fresh fetch =
=A0of that
>> > doesn't show the commits)
>>
>> I can't push it out until after 3.1-rc1 is released because it is
>> targeted at 3.2 now.
>
> It'd probably make sense for it to be merged into my tree along with
> the rest of my gpio changes, otherwise we're going to head for merge
> conflicts. =A0I'll be publishing those gpio.h changes in the next few
> days.

Okay, I'll drop it from my tree and you can add my:

Acked-by: Grant Likely <grant.likely@secretlab.ca>

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
