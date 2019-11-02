From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/9] iommu: Document iommu_fwspec::flags field
Date: Sat,  2 Nov 2019 18:56:29 +0100
Message-ID: <20191102175637.3065-2-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gdGhpcyBmaWVs
ZCB3YXMgYWRkZWQgaW4gY29tbWl0IDU3MDJlZTI0MTgyZiAoIkFDUEkvSU9SVDogQ2hlY2sgQVRT
CmNhcGFiaWxpdHkgaW4gcm9vdCBjb21wbGV4IG5vZGVzIiksIHRoZSBrZXJuZWxkb2MgY29tbWVu
dCB3YXNuJ3QgdXBkYXRlZAphdCB0aGUgc2FtZSB0aW1lLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2lvbW11Lmgg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvaW9tbXUuaCBiL2luY2x1ZGUvbGludXgvaW9tbXUuaAppbmRleCBlMjhlODBkZWEx
NDEuLjdiZjAzOGIzNzFiOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pb21tdS5oCisrKyBi
L2luY2x1ZGUvbGludXgvaW9tbXUuaApAQCAtNTcwLDYgKzU3MCw3IEBAIHN0cnVjdCBpb21tdV9n
cm91cCAqZnNsX21jX2RldmljZV9ncm91cChzdHJ1Y3QgZGV2aWNlICpkZXYpOwogICogQG9wczog
b3BzIGZvciB0aGlzIGRldmljZSdzIElPTU1VCiAgKiBAaW9tbXVfZndub2RlOiBmaXJtd2FyZSBo
YW5kbGUgZm9yIHRoaXMgZGV2aWNlJ3MgSU9NTVUKICAqIEBpb21tdV9wcml2OiBJT01NVSBkcml2
ZXIgcHJpdmF0ZSBkYXRhIGZvciB0aGlzIGRldmljZQorICogQGZsYWdzOiBJT01NVSBmbGFncyBh
c3NvY2lhdGVkIHdpdGggdGhpcyBkZXZpY2UKICAqIEBudW1faWRzOiBudW1iZXIgb2YgYXNzb2Np
YXRlZCBkZXZpY2UgSURzCiAgKiBAaWRzOiBJRHMgd2hpY2ggdGhpcyBkZXZpY2UgbWF5IHByZXNl
bnQgdG8gdGhlIElPTU1VCiAgKi8KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
