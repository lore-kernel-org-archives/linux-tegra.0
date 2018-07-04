From: Stefan Agner <stefan@agner.ch>
Subject: Re: [bug report] mtd: rawnand: add NVIDIA Tegra NAND Flash controller
 driver
Date: Wed, 04 Jul 2018 10:14:30 +0200
Message-ID: <7d4f6f714c758ccecfd023f575a840e6@agner.ch>
References: <20180703141957.j27w6efnkhij5blz@kili.mountain>
 <20180703220424.52c3d8f2@bbrezillon>
 <97dad372225961450773b9375920d806@agner.ch>
 <20180704095208.090b8091@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180704095208.090b8091@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-tegra@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-tegra@vger.kernel.org

On 04.07.2018 09:52, Boris Brezillon wrote:
> On Wed, 04 Jul 2018 09:43:44 +0200
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> On 03.07.2018 22:04, Boris Brezillon wrote:
>> > On Tue, 3 Jul 2018 17:19:57 +0300
>> > Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> >
>> >> Hello Stefan Agner,
>> >>
>> >> The patch d7d9f8ec77fe: "mtd: rawnand: add NVIDIA Tegra NAND Flash
>> >> controller driver" from Jun 24, 2018, leads to the following static
>> >> checker warning:
>> >>
>> >> 	drivers/mtd/nand/raw/tegra_nand.c:476 tegra_nand_select_chip()
>> >> 	warn: array off by one? 'nand->cs[die_nr]'
>> >>
>> >> drivers/mtd/nand/raw/tegra_nand.c
>> >>    465  static void tegra_nand_select_chip(struct mtd_info *mtd, int die_nr)
>> >>    466  {
>> >>    467          struct nand_chip *chip = mtd_to_nand(mtd);
>> >>    468          struct tegra_nand_chip *nand = to_tegra_chip(chip);
>> >>    469          struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
>> >>    470
>> >>    471          if (die_nr < 0 || die_nr > 1) {
>> >>    472                  ctrl->cur_cs = -1;
>> >>    473                  return;
>> >>    474          }
>> >>    475
>> >>    476          ctrl->cur_cs = nand->cs[die_nr];
>> >>    477  }
>> >>
>> >> The story is that nand->cs[] is a one element array.  Some people use
>> >> one element arrays like this as variable size arrays.  It's better to
>> >> use a zero size array, but I think that might be a GCC feature and not
>> >> everyone knows you can do that.  Smatch treats this one as unknown size
>> >> because apparently it can't tie it back to the kmalloc().
>> >>
>> >> But it really is a one element array and the condition is off by one.
>> >
>> > I don't see where it's off by one? With the above test, die_nr is
>> > guaranteed to be 0 when you reach the
>> > "ctrl->cur_cs = nand->cs[die_nr];" statement, right? Am I missing
>> > something?
>> >
>>
>> Yeah I had to look twice too. But die_nr can be 1 according to this
>> code...
>>
>> It should be:
>> if (die_nr < 0 || die_nr >= 1) {
> 
> Oh, brain fart on my end. Indeed, now that I see the fix it's
> obvious :-).
> 
> You should probably add a WARN_ON(die_nr >= ARRAY_SIZE(nand->cs)),
> because that would clearly be a bug in the core if you're passed a CS
> that is not 0 or -1 since you pass max_chipselect = 1 to nand_scan().

IMHO checking whether the stack behaves in a driver should not be
necessary...

The stack could ask for cs = 1 because the driver miss informs the stack
(wrong max_chipselect). So I guess a runtime check might be sensible.

--
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
