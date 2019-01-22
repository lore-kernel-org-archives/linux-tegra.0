From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: use unnamed union in struct
 nand_op_parser_pattern_elem
Date: Tue, 22 Jan 2019 08:49:44 +0100
Message-ID: <20190122084944.420fcd4a@xps13>
References: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
        <1548142975-14219-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548142975-14219-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Stefan Agner <stefan@agner.ch>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-tegra@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>
List-Id: linux-tegra@vger.kernel.org

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 22 Jan
2019 16:42:55 +0900:

> Although drivers do not directly get access to the private data of
> instruction patterns, let's use unnamed union field to be consistent
> with nand_op_instr.
> 

Actually this is how we wrote it the first time. Then we got robots
reporting that anonymous unions where not allowed with older (still
supported) GCC versions and I had to do this:


commit c1a72e2dbb4abb90bd408480d7c48ba40cb799ce
Author: Miquel Raynal <miquel.raynal@free-electrons.com>
Date:   Fri Jan 19 19:11:27 2018 +0100

    mtd: nand: Fix build issues due to an anonymous union
    
    GCC-4.4.4 raises errors when assigning a parameter in an anonymous
    union, leading to this kind of failure:
    
    drivers/mtd/nand/marvell_nand.c:1936:
        warning: missing braces around initializer
        warning: (near initialization for '(anonymous)[1].<anonymous>')
        error: unknown field 'data' specified in initializer
        error: unknown field 'addr' specified in initializer
    
    Work around the situation by naming these unions.
    
    Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
    Reported-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
    Tested-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>


Thanks,
Miquèl
