From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 10:07:31 +0000
Message-ID: <20190305100731.uz6tleu3fkaruwb6@shell.armlinux.org.uk>
References: <CA+_ZnZR_aTubOh3PJEVK0hbcDxxfK3vW1eLoknVo1yRBExawsw@mail.gmail.com>
 <20190302115729.zbowssfwf4j7jf22@shell.armlinux.org.uk>
 <CA+_ZnZS48d0OOTQJjktieO-yf09Ch6MRQLFoCjRtUgcXMrjWmg@mail.gmail.com>
 <20190302123907.qoe46qs6qmx7qnjs@shell.armlinux.org.uk>
 <453072a9-52e2-7591-750f-624ca27e0bbf@gmx.net>
 <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
 <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Embedded Engineer <embed786@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 05, 2019 at 03:01:35PM +0500, Embedded Engineer wrote:
> On Mon, Mar 4, 2019 at 7:25 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > Perhaps also try to run a recent linux-next just to exclude any issues
> > that may have been part of the 4.8.0-rc7 that you tested.
> 
> Thierry I have disabled cache as per Andrew's suggestion by calling
> dcache_disable() and icache_disable() just before kernel_entry() in
> u-boot source. I have also build the linux-next kernel and tested by
> booting from microSD card but it is not going upto login console and
> hangs midway. Please have a look at kernel logs in below link:
> 
> https://pastebin.com/ByuaLxTt

Please apply this patch so we can see the (ptrval) values.  Thanks.

8<===
From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH] lib: make vsprintf print pointers without munging

Printing pointers is useful for debugging, disable this so I can debug
the kernel.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 lib/vsprintf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 37a54a6dd594..c2ae4075c786 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -687,9 +687,9 @@ early_initcall(initialize_ptr_random);
 static char *ptr_to_id(char *buf, char *end, const void *ptr,
 		       struct printf_spec spec)
 {
-	const char *str = sizeof(ptr) == 8 ? "(____ptrval____)" : "(ptrval)";
 	unsigned long hashval;
 
+#if 0
 	/* When debugging early boot use non-cryptographically secure hash. */
 	if (unlikely(debug_boot_weak_hash)) {
 		hashval = hash_long((unsigned long)ptr, 32);
@@ -697,6 +697,7 @@ static char *ptr_to_id(char *buf, char *end, const void *ptr,
 	}
 
 	if (static_branch_unlikely(&not_filled_random_ptr_key)) {
+		const char *str = sizeof(ptr) == 8 ? "(____ptrval____)" : "(ptrval)";
 		spec.field_width = 2 * sizeof(ptr);
 		/* string length must be less than default_width */
 		return string(buf, end, str, spec);
@@ -712,6 +713,9 @@ static char *ptr_to_id(char *buf, char *end, const void *ptr,
 #else
 	hashval = (unsigned long)siphash_1u32((u32)ptr, &ptr_key);
 #endif
+#else
+	hashval = (unsigned long)ptr;
+#endif
 	return pointer_string(buf, end, (const void *)hashval, spec);
 }
 
-- 
2.7.4

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
