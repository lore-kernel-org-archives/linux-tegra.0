From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 1/9] iommu: Document iommu_fwspec::flags field
Date: Mon,  9 Dec 2019 12:59:57 +0100
Message-ID: <20191209120005.2254786-2-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Joerg Roedel <jroedel@suse.de>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gdGhpcyBmaWVs
ZCB3YXMgYWRkZWQgaW4gY29tbWl0IDU3MDJlZTI0MTgyZiAoIkFDUEkvSU9SVDogQ2hlY2sgQVRT
CmNhcGFiaWxpdHkgaW4gcm9vdCBjb21wbGV4IG5vZGVzIiksIHRoZSBrZXJuZWxkb2MgY29tbWVu
dCB3YXNuJ3QgdXBkYXRlZAphdCB0aGUgc2FtZSB0aW1lLgoKQWNrZWQtYnk6IEpvZXJnIFJvZWRl
bCA8anJvZWRlbEBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGlu
Z0BudmlkaWEuY29tPgotLS0KIGluY2x1ZGUvbGludXgvaW9tbXUuaCB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb21tdS5o
IGIvaW5jbHVkZS9saW51eC9pb21tdS5oCmluZGV4IGYyMjIzY2JiNWZkNS4uMjE2ZTkxOTg3NWVh
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2lvbW11LmgKKysrIGIvaW5jbHVkZS9saW51eC9p
b21tdS5oCkBAIC01NzAsNiArNTcwLDcgQEAgc3RydWN0IGlvbW11X2dyb3VwICpmc2xfbWNfZGV2
aWNlX2dyb3VwKHN0cnVjdCBkZXZpY2UgKmRldik7CiAgKiBAb3BzOiBvcHMgZm9yIHRoaXMgZGV2
aWNlJ3MgSU9NTVUKICAqIEBpb21tdV9md25vZGU6IGZpcm13YXJlIGhhbmRsZSBmb3IgdGhpcyBk
ZXZpY2UncyBJT01NVQogICogQGlvbW11X3ByaXY6IElPTU1VIGRyaXZlciBwcml2YXRlIGRhdGEg
Zm9yIHRoaXMgZGV2aWNlCisgKiBAZmxhZ3M6IElPTU1VIGZsYWdzIGFzc29jaWF0ZWQgd2l0aCB0
aGlzIGRldmljZQogICogQG51bV9pZHM6IG51bWJlciBvZiBhc3NvY2lhdGVkIGRldmljZSBJRHMK
ICAqIEBpZHM6IElEcyB3aGljaCB0aGlzIGRldmljZSBtYXkgcHJlc2VudCB0byB0aGUgSU9NTVUK
ICAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
